// ===========================================================================
// SCRIPT:       scr_enemy_predator_states
// REVISION:     1.0.0
// SYSTEM:       Enemy Predator States System
// ARCHITECTURE: Shared Enemy Predator States System
//
// DESCRIPTION:
// Defines predator enemy states for patrolling, detecting a player, chasing, and attacking at close range.
//
// ===========================================================================

/// @function Predator_Roam
/// @description Handles predator roam for this file's subsystem.
/// @param {Any} _sm Input used by Predator_Roam.
/// @returns {Any} The result of the operation, when it produces one.
function Predator_Roam(_sm) {
	return {
		on_update: function() {
			var o = _sm.owner;
			var target = instance_nearest(o.x, o.y, obj_animal_sheep);

			if (target != noone) {
				o.target = target;
				_sm.change(Predator_Hunt(_sm));
			}
		},
	};
}

/// @function Predator_Hunt
/// @description Handles predator hunt for this file's subsystem.
/// @param {Any} _sm Input used by Predator_Hunt.
/// @returns {Any} The result of the operation, when it produces one.
function Predator_Hunt(_sm) {
	return {
		on_update: function() {
			var o = _sm.owner;
			var t = o.target;

			if (!instance_exists(t)) {
				_sm.change(Predator_Roam(_sm));
				return;
			}

			var dir = point_direction(o.x, o.y, t.x, t.y);

			o.apply_movement(lengthdir_x(o.speed, dir), lengthdir_y(o.speed, dir));

			if (point_distance(o.x, o.y, t.x, t.y) < 20) {
				with (t) {
					instance_destroy();
				}
				_sm.change(Predator_Roam(_sm));
			}
		},
	};
}

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
