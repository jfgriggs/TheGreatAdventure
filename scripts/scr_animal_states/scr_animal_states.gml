// =============================================================================
// SCRIPT:      scr_animal_states
// TYPE:        Animal State Definitions
// =============================================================================

/// @description Contains all animal state constructors and shared animal AI state behavior.
///
/// Responsibilities:
/// - Define animal AI states
/// - Handle state transitions
/// - Process wandering behavior
/// - Handle follow targeting
/// - Process eating behavior
/// - Handle safe/pen states
/// - Coordinate movement requests
///
/// States:
/// - AnimalState_Idle
/// - AnimalState_Follow
/// - AnimalState_Eat
/// - AnimalState_Safe
///
/// Notes:
/// - States are struct-based
/// - Transitions use sm.change(NewState(sm))
/// - Shared AI helpers belong in scr_ai_common
/// - Shared movement logic belongs in scr_movement
/// - Avoid embedding species-specific logic directly in states


function Animal_Idle(_sm) {
    return {
        sm: _sm,
        owner: _sm.owner,

        enter: function() {
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

        update: function() {
            // =============================================================
            // LOOK FOR FOOD
            // =============================================================
            var food =  (owner);

            if (food != noone) {
                owner.target = food;
                owner.target_type = "food";

                sm.change(Animal_Follow(sm));
                return;
            }

            // =============================================================
            // WANDER TIMER
            // =============================================================
            owner.wander_timer--;

            if (owner.wander_timer <= 0) {

                if (owner.wander_state == "move") {
                    owner.wander_state = "idle";
                    owner.wander_timer = irandom_range(
                        owner.wander_idle_time_min,
                        owner.wander_idle_time_max
                    );

                } else {
                    owner.wander_state = "move";
                    owner.wander_dir = irandom(359);
                    owner.wander_timer = irandom_range(
                        owner.wander_move_time_min,
                        owner.wander_move_time_max
                    );
                }
            }

            // =============================================================
            // MOVEMENT
            // =============================================================
            if (owner.wander_state == "move") {
                owner.vx = lengthdir_x(owner.wander_speed, owner.wander_dir);
                owner.vy = lengthdir_y(owner.wander_speed, owner.wander_dir);

                owner.apply_movement(owner.vx, owner.vy);
				Animal_Update_Facing(owner);
            }
        }
    };
}


function Animal_Follow(_sm) {
    return {
		sm: _sm,
		owner: _sm.owner,

		update: function() {
			if (distance_to_object(owner.target) <= 12) {
			    sm.change(Animal_Eat(sm));
			    return;
			}
        }
    };
}

function Animal_Eat(_sm) {
    return {
        sm: _sm,
        owner: _sm.owner,

        enter: function() {
            owner.eat_timer = 0;
        },

        update: function() {
            if (!instance_exists(owner.target)) {
                sm.change(Animal_Idle(sm));
                return;
            }

            owner.eat_timer--;
            if (owner.eat_timer <= 0) {
                owner.eat_timer = game_get_speed(gamespeed_fps) div 4;
                Item_Take_Damage(owner.target, 1);
            }

            if (!instance_exists(owner.target)) {
                owner.target = noone;
                sm.change(Animal_Idle(sm));
            }
        }
    };
}