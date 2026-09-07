// ===========================================================================
// SCRIPT:       scr_enemy_archer_states
// REVISION:     1.0.0
// SYSTEM:       Enemy Archer States System
// ARCHITECTURE: Shared Enemy Archer States System
//
// DESCRIPTION:
// Defines archer patrol, chase, and shoot states. The shoot state periodically creates and aims an arrow projectile.
//
// ===========================================================================

/// @function Archer_Patrol
/// @description Handles archer patrol for this file's subsystem.
/// @param {Any} _sm Input used by Archer_Patrol.
/// @returns {Any} The result of the operation, when it produces one.
function Archer_Patrol(_sm) {
	return {
		on_enter: function() {
			_sm.owner.wander_dir = irandom(359);
		},
		on_update: function() {
			var o = _sm.owner;
			var p = global.player_object;

			o.apply_movement(
				lengthdir_x(o.speed, o.wander_dir),
				lengthdir_y(o.speed, o.wander_dir)
			);

			if (point_distance(o.x, o.y, p.x, p.y) < o.vision_range) {
				_sm.change(Archer_Chase(_sm));
			}
		},
	};
}

/// @function Archer_Chase
/// @description Handles archer chase for this file's subsystem.
/// @param {Any} _sm Input used by Archer_Chase.
/// @returns {Any} The result of the operation, when it produces one.
function Archer_Chase(_sm) {
	return {
		on_update: function() {
			var o = _sm.owner;
			var p = global.player_object;

			var dir = point_direction(o.x, o.y, p.x, p.y);

			o.apply_movement(lengthdir_x(o.speed, dir), lengthdir_y(o.speed, dir));

			if (point_distance(o.x, o.y, p.x, p.y) < o.attack_range) {
				_sm.change(Archer_Attack(_sm));
			}
		},
	};
}

/// @function Archer_Shoot
/// @description Handles archer shoot for this file's subsystem.
/// @param {Any} _sm Input used by Archer_Shoot.
/// @returns {Any} The result of the operation, when it produces one.
function Archer_Shoot(_sm) {
	return {
		on_update: function() {
			var o = _sm.owner;
			var p = global.player_object;

			if (_sm.time % o.fire_rate == 0) {
				var proj = instance_create_layer(
					o.x,
					o.y,
					"Instances",
					obj_projectile_pellets
				);
				proj.direction = point_direction(o.x, o.y, p.x, p.y);
			}

			if (point_distance(o.x, o.y, p.x, p.y) > o.attack_range) {
				_sm.change(Archer_Chase(_sm));
			}
		},
	};
}

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
