// ===========================================================================
// OBJECT:       obj_enemy
// EVENT:        Step
// REVISION:     1.0.0
// SYSTEM:       Enemy Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Runs shared enemy runtime updates, including game-state gating, invincibility countdown, knockback, and death-related behavior.
//
// ===========================================================================

if (global.game_state != GAME_STATE.PLAYING) {
	exit;
}

/// =========================================================
/// FLASH TIMER
/// =========================================================

if (flash_timer > 0) {
	flash_timer--;
}

/// =========================================================
/// ATTACK TIMER
/// =========================================================

if (attack_timer > 0) {
	attack_timer--;
}

/// =========================================================
/// STATE MACHINE
/// =========================================================

sm.update();

/// =========================================================
/// DEPTH
/// =========================================================

depth = -y;

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
