// ===========================================================================
// OBJECT:       obj_enemy_wolf
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Enemy Wolf Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures wolf speed, health, invincibility, knockback, and an instance movement function.
//
// ===========================================================================

sm = new StateMachine(id);

speed = 3;

hp = 30;
iframes = 10;
invincible_timer = 0;

knockback_x = 0;
knockback_y = 0;
knockback_force = 5;

sm.change(Predator_Roam(sm));

/// @function apply_movement
/// @description Handles apply movement for this file's subsystem.
/// @param {Any} _vx Input used by apply_movement.
/// @param {Any} _vy Input used by apply_movement.
/// @returns {void} The result of the operation, when it produces one.
apply_movement = function(_vx, _vy) {
	var o = self;
};

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
