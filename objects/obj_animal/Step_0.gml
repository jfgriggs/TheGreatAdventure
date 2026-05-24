// =============================================================================
// OBJECT:      obj_animal
// EVENT:       Step
// SYSTEM:      Animal Base Runtime Update
// =============================================================================

/// @description Updates shared animal AI, movement, targeting, and state-driven behavior for all animal child objects.
///
/// Child Objects:
/// - obj_animal_chicken
/// - obj_animal_cow
/// - obj_animal_sheep
/// - obj_animal_*
///
/// Responsibilities:
/// - Update animal state machine
///
/// Notes:
/// - AI behavior should remain state-driven
/// - Child objects should inherit shared behavior
/// - Avoid embedding complex AI logic directly here

// If game not playing stop
if (global.game_state != GAME_STATE.PLAYING) {
	exit;
}

/// =========================================================
/// Flash Timer
/// =========================================================

if (flash_timer > 0) {
	flash_timer--;
}

/// =========================================================
/// Flee Timer
/// =========================================================

if (flee_timer > 0) {
	flee_timer--;

	// Gradually slow down.
	flee_speed_current = max(wander_speed, flee_speed_current - flee_slowdown);
} else {
	flee_source = noone;

	flee_speed_current = wander_speed;
}

/// =========================================================
/// STATE MACHINE
/// =========================================================
sm.update();

/// =========================================================
/// SAFE AREA CHECK
/// =========================================================
is_safe = Animal_IsSafe(self);

/// =========================================================
/// DEPTH SORTING
/// =========================================================
depth = -y;
