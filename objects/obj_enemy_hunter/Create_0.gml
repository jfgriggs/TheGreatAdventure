// ===========================================================================
// OBJECT:       obj_enemy_hunter
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Enemy Hunter Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Initializes hunter-specific speed, vision and attack ranges, fire rate, health, invincibility, knockback, and local movement function.
//
// ===========================================================================

sm = new StateMachine(id);

speed = 2;

vision_range = 300;
attack_range = 200;
fire_rate = 30;

// Health
hp = 20;
iframes = 10;
invincible_timer = 0;

knockback_x = 0;
knockback_y = 0;
knockback_force = 4;

sm.change(Archer_Patrol(sm));

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
