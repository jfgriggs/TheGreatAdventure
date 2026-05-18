// =============================================================================
// SCRIPT: scr_animal_states
// =============================================================================

function Animal_Idle(_sm) {

    return {

        sm : _sm,
        owner : _sm.owner,

        enter : function() {

            owner.wander_state = choose("move", "idle");
            owner.wander_dir = irandom(359);

            if (owner.wander_state == "move") {

                owner.wander_timer = irandom_range(
                    owner.wander_move_time_min,
                    owner.wander_move_time_max
                );

            } else {

                owner.wander_timer = irandom_range(
                    owner.wander_idle_time_min,
                    owner.wander_idle_time_max
                );
            }
        },

        update : function() {

            // =========================================================
            // LOOK FOR FOOD
            // =========================================================
            var food = Animal_FindTarget(owner);

            if (food != noone) {

                owner.target = food;
                owner.target_type = "food";

                sm.change(Animal_Follow(sm));
                return;
            }


            // =========================================================
            // WANDER TIMER
            // =========================================================
            owner.wander_timer--;

			if (owner.wander_timer <= 0) {

			    // =====================================================
			    // RANDOMLY CHOOSE NEXT WANDER STATE
			    // =====================================================
			    owner.wander_state = choose("move", "idle");

			    // =====================================================
			    // MOVING
			    // =====================================================
			    if (owner.wander_state == "move") {
			        // Pick a NEW direction every move cycle
			        owner.wander_dir = irandom(359);

			        owner.wander_timer = irandom_range(
			            owner.wander_move_time_min,
			            owner.wander_move_time_max
			        );

			    // =====================================================
			    // IDLE
			    // =====================================================
			    } else {
			        owner.wander_timer = irandom_range(
			            owner.wander_idle_time_min,
			            owner.wander_idle_time_max
			        );
			    }
			}


            // =========================================================
            // MOVEMENT
            // =========================================================
            if (owner.wander_state == "move") {

                owner.vx = lengthdir_x(
                    owner.wander_speed,
                    owner.wander_dir
                );

                owner.vy = lengthdir_y(
                    owner.wander_speed,
                    owner.wander_dir
                );
				
				owner.image_speed = 1;

                owner.apply_movement(
                    owner.vx,
                    owner.vy
                );

                Animal_Update_Facing(owner);

            } else {

                owner.vx = 0;
                owner.vy = 0;

                Animal_Update_Facing(owner);
            }
        }
    };
}



// =============================================================================
// FOLLOW
// =============================================================================
function Animal_Follow(_sm) {

    return {

        sm : _sm,
        owner : _sm.owner,

        update : function() {

            // =========================================================
            // VALIDATE TARGET
            // =========================================================
            if (!instance_exists(owner.target)) {

                owner.target = noone;

                sm.change(Animal_Idle(sm));
                return;
            }


            // =========================================================
            // DISTANCE
            // =========================================================
            var dist = point_distance(
                owner.x,
                owner.y,
                owner.target.x,
                owner.target.y
            );

            if (dist <= 12) {

                owner.vx = 0;
                owner.vy = 0;

                sm.change(Animal_Eat(sm));
                return;
            }


            // =========================================================
            // FOLLOW MOVEMENT
            // =========================================================
            var dir = point_direction(
                owner.x,
                owner.y,
                owner.target.x,
                owner.target.y
            );

            owner.vx = lengthdir_x(
                owner.move_speed,
                dir
            );

            owner.vy = lengthdir_y(
                owner.move_speed,
                dir
            );

            owner.apply_movement(
                owner.vx,
                owner.vy
            );

            Animal_Update_Facing(owner);
        }
    };
}



// =============================================================================
// EAT
// =============================================================================
function Animal_Eat(_sm) {

    return {

        sm : _sm,
        owner : _sm.owner,

        enter : function() {

            owner.eat_timer =
                game_get_speed(gamespeed_fps) div 4;

            owner.vx = 0;
            owner.vy = 0;

		    owner.image_speed = 0;
		    owner.image_index = 0;

            Animal_Update_Facing(owner);
        },

        update : function() {

            // =========================================================
            // TARGET LOST
            // =========================================================
            if (!instance_exists(owner.target)) {

                owner.target = noone;

                sm.change(Animal_Idle(sm));
                return;
            }

			// =========================================================
			// REEVALUATE BETTER FOOD
			// =========================================================
			var better_food = Animal_FindTarget(owner);

			if (better_food != noone && better_food != owner.target) {

			    var current_desire =
			        Animal_Get_Item_Desire(
			            owner,
			            owner.target.item
			        );

			    var better_desire =
			        Animal_Get_Item_Desire(
			            owner,
			            better_food.item
			        );

			    // Switch only if significantly better
			    if (better_desire > current_desire) {

			        owner.target = better_food;

			        sm.change(Animal_Follow(sm));
			        return;
			    }
			}

            // =========================================================
            // EAT TIMER
            // =========================================================
            owner.eat_timer--;

            if (owner.eat_timer <= 0) {

                owner.eat_timer =
                    game_get_speed(gamespeed_fps) div 4;

                Item_Take_Damage(owner.target, 1);
            }

            // =========================================================
            // FOOD DESTROYED
            // =========================================================
            if (!instance_exists(owner.target)) {

                owner.target = noone;

                sm.change(Animal_Idle(sm));
            }
        }
    };
}