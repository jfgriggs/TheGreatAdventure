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
/// - Process wandering behavior
/// - Handle follow targeting
/// - Validate line-of-sight
/// - Process eating behavior
/// - Handle pen/safe state checks
/// - Apply movement and collision
/// - Update animation state
///
/// Notes:
/// - AI behavior should remain state-driven
/// - Shared AI helpers belong in scr_ai_common
/// - Terrain-aware movement belongs in scr_movement
/// - Child objects should inherit shared behavior
/// - Avoid embedding complex AI logic directly here

// If game not playing stop
if (global.game_state != GAME_STATE.PLAYING) exit;

if (!initialized) {
    Animal_Initialize(self);
	if (!initialized) exit;
}

sm.update();

