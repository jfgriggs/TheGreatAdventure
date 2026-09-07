// ===========================================================================
// SCRIPT:       scr_animal_states
// REVISION:     1.0.0
// SYSTEM:       Animal States System
// ARCHITECTURE: Shared Animal States System
//
// DESCRIPTION:
// Builds animal behavior states such as wandering, fleeing, and returning or resting, using callbacks for updates and transitions.
//
// ===========================================================================

/// @function Animal_Decide
/// @description Handles animal decide for this file's subsystem.
/// @param {Any} _sm Input used by Animal_Decide.
/// @returns {Any} The result of the operation, when it produces one.
function Animal_Decide(_sm) {
	return {
		sm: _sm,
		owner: _sm.owner,
		on_enter: function() {
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
		on_update: function() {
			// =========================================================
			// LOOK FOR FOOD
			// =========================================================
			var food = Animal_FindTarget(owner);

			if (food != noone) {
				owner.target = food;

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
				//owner.vx = lengthdir_x(owner.wander_speed, owner.wander_dir);
				//owner.vy = lengthdir_y(owner.wander_speed, owner.wander_dir);
				//owner.apply_movement(owner.vx, owner.vy);

				owner.max_speed = owner.wander_speed;
				owner.move_input_x = lengthdir_x(1, owner.wander_dir);
				owner.move_input_y = lengthdir_y(1, owner.wander_dir);
				owner.image_speed = 1;

				Animal_Update_Facing(owner);
			} else {
				owner.move_input_x = 0;
				owner.move_input_y = 0;

				Animal_Update_Facing(owner);
			}
		},
	};
}

// =============================================================================
// FOLLOW
// =============================================================================
/// @function Animal_Follow
/// @description Handles animal follow for this file's subsystem.
/// @param {Any} _sm Input used by Animal_Follow.
/// @returns {Any} The result of the operation, when it produces one.
function Animal_Follow(_sm) {
	return {
		sm: _sm,
		owner: _sm.owner,
		on_update: function() {
			// =========================================================
			// VALIDATE TARGET
			// =========================================================
			if (!instance_exists(owner.target)) {
				owner.target = noone;

				sm.change(Animal_Decide(sm));
				return;
			}

			// =========================================================
			// DISTANCE
			// =========================================================
			var dist = point_distance(owner.x, owner.y, owner.target.x, owner.target.y);

			if (dist <= 12) {
				//owner.vx = 0;
				//owner.vy = 0;

				owner.move_input_x = 0;
				owner.move_input_y = 0;

				sm.change(Animal_Eat(sm));
				return;
			}

			// =========================================================
			// FOLLOW MOVEMENT
			// =========================================================
			var dir = point_direction(owner.x, owner.y, owner.target.x, owner.target.y);

			//owner.vx = lengthdir_x(owner.move_speed, dir);
			//owner.vy = lengthdir_y(owner.move_speed, dir);
			//owner.apply_movement(owner.vx, owner.vy);`

			owner.max_speed = owner.move_speed;
			owner.move_input_x = lengthdir_x(1, dir);
			owner.move_input_y = lengthdir_y(1, dir);

			Animal_Update_Facing(owner);
		},
	};
}

// =============================================================================
// EAT
// =============================================================================
/// @function Animal_Eat
/// @description Handles animal eat for this file's subsystem.
/// @param {Any} _sm Input used by Animal_Eat.
/// @returns {Any} The result of the operation, when it produces one.
function Animal_Eat(_sm) {
	return {
		sm: _sm,
		owner: _sm.owner,
		on_enter: function() {
			owner.eat_timer = game_get_speed(gamespeed_fps) div 4;

			//owner.vx = 0;
			//owner.vy = 0;
			owner.move_input_x = 0;
			owner.move_input_y = 0;
			owner.image_speed = 0;
			owner.image_index = 0;

			Animal_Update_Facing(owner);
		},
		on_update: function() {
			// =========================================================
			// TARGET LOST
			// =========================================================
			if (!instance_exists(owner.target)) {
				owner.target = noone;

				sm.change(Animal_Decide(sm));
				return;
			}

			// =========================================================
			// REEVALUATE BETTER FOOD
			// =========================================================
			var better_food = Animal_FindTarget(owner);

			if (better_food != noone && better_food != owner.target) {
				var current_desire = Animal_Get_Item_Desire(owner, owner.target.item);

				var better_desire = Animal_Get_Item_Desire(owner, better_food.item);

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
				owner.eat_timer = game_get_speed(gamespeed_fps) div 4;

				Item_Take_Damage(owner.target, 1);
			}

			// =========================================================
			// FOOD DESTROYED
			// =========================================================
			if (!instance_exists(owner.target)) {
				owner.target = noone;

				sm.change(Animal_Decide(sm));
			}
		},
	};
}

// =============================================================================
// FLEE
// =============================================================================
/// @function Animal_Flee
/// @description Handles animal flee for this file's subsystem.
/// @param {Any} _sm Input used by Animal_Flee.
/// @returns {Any} The result of the operation, when it produces one.
function Animal_Flee(_sm) {
	return {
		sm: _sm,
		owner: _sm.owner,

		on_enter: function() {
			// Abandon any current task while fleeing.
			owner.target = noone;

			// Resume normal animation while moving.
			owner.image_speed = 1;
			
			owner.flee_speed_current = owner.flee_speed_multiplier;
			owner.movement_speed_multiplier = owner.flee_speed_current;

			// Panic burst.
			owner.movement_acceleration_multiplier = owner.flee_acceleration_multiplier;
		},

		on_update: function() {

			// =========================================================
			// FLEE COMPLETE
			// =========================================================
			if (owner.flee_timer <= 0 || !instance_exists(owner.flee_source)) {
				owner.flee_source = noone;
				owner.move_input_x = 0;
				owner.move_input_y = 0;
				owner.movement_speed_multiplier = 1.0;
				sm.change(Animal_Decide(sm));
				return;
			}

			// =========================================================
			// MOVE AWAY FROM THREAT
			// =========================================================
			var dir = point_direction(
				owner.flee_source.x,
				owner.flee_source.y,
				owner.x,
				owner.y
			);

			owner.move_input_x = lengthdir_x(1, dir);
			owner.move_input_y = lengthdir_y(1, dir);
			Animal_Update_Facing(owner);
		},
		
		on_exit: function() {
			owner.movement_speed_multiplier = 1.0;
			owner.movement_acceleration_multiplier = 1.0;
		},
	};
}

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
