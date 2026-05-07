// =============================================================================
// OBJECT:      obj_enemy_parent
// EVENT:       Step
// SYSTEM:      Enemy Base Runtime Update
// =============================================================================

/// @description Updates shared enemy AI, movement, targeting, combat behavior, and state-driven logic for all enemy child objects.
///
/// Child Objects:
/// - obj_enemy_archer
/// - obj_enemy_predator
/// - obj_enemy_*
///
/// Responsibilities:
/// - Update enemy state machine
/// - Process patrol behavior
/// - Handle target acquisition
/// - Validate line-of-sight
/// - Process chase behavior
/// - Handle attack behavior
/// - Apply movement and collision
/// - Update animation state
/// - Process combat interactions
///
/// Notes:
/// - AI behavior should remain state-driven
/// - Shared AI helpers belong in scr_ai_common
/// - Shared combat logic belongs in scr_combat
/// - Shared movement logic belongs in scr_movement
/// - Child objects should inherit shared behavior
/// - Avoid embedding enemy-specific behavior directly here

// If game not playing stop
if (global.game_state != GAME_STATE.PLAYING) {
    exit;
}
