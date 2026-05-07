// =============================================================================
// OBJECT:      obj_trap
// EVENT:       Step
// SYSTEM:      Trap Runtime Update
// =============================================================================

/// @description Updates trap activation, interaction checks, runtime state, and effect processing.
///
/// Responsibilities:
/// - Detect entity interactions
/// - Process trap activation
/// - Apply damage/effects
/// - Update timers/state
/// - Trigger visual/audio feedback
/// - Handle reset/cooldown behavior
///
/// Notes:
/// - Shared combat/effect systems should remain centralized
/// - Avoid embedding entity-specific logic directly here
/// - Trap effects should remain modular and data-driven

// If game not playing stop
if (global.game_state != GAME_STATE.PLAYING) {
    exit;
}

lifetime--;
if (lifetime <= 0) instance_destroy();

// Affect enemies
with (obj_enemy_archer) {
    if (point_distance(x,y,other.x,other.y) < other.radius) {
        speed *= 0.9;
    }
}

with (obj_enemy_predator) {
    if (point_distance(x,y,other.x,other.y) < other.radius) {
        speed *= 0.9;
    }
}