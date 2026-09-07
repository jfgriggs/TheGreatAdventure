// ===========================================================================
// OBJECT:       obj_enemy_archer
// EVENT:        Step
// REVISION:     1.0.0
// SYSTEM:       Enemy Archer Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Updates the archer's state machine and damage-response movement each frame.
//
// ===========================================================================

if (global.game_state != GAME_STATE.PLAYING) {
	exit;
}

sm.update();

if (invincible_timer > 0) {
	invincible_timer--;
}

if (abs(knockback_x) > 0.1 || abs(knockback_y) > 0.1) {
	self.apply_movement(knockback_x, knockback_y);
	knockback_x *= 0.8;
	knockback_y *= 0.8;
}

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
