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
if (global.game_state != GAME_STATE.PLAYING) exit;

sm.update();

