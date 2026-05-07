// =============================================================================
// OBJECT:      obj_enemy_predator
// EVENT:       Create
// SYSTEM:      Enemy Configuration
// =============================================================================

/// @description Configures predator-specific enemy data, combat behavior, and AI tuning.
///
/// Parent Object:
/// - obj_enemy_parent
///
/// Responsibilities:
/// - Assign enemy type
/// - Configure predator data struct
/// - Setup ranged combat properties
/// - Configure movement/AI tuning
/// - Initialize targeting variables
/// - Configure projectile behavior
/// - Setup visual/animation configuration
///
/// Notes:
/// - Inherits shared enemy behavior from obj_enemy_parent
/// - Shared AI logic belongs in scr_enemy_states
/// - Shared combat logic belongs in scr_combat
/// - Enemy definitions should remain data-driven
/// - Avoid duplicating shared enemy functionality here

if (global.game_state != GAME_STATE.PLAYING) exit;

sm.update();

if (invincible_timer > 0) invincible_timer--;

if (abs(knockback_x) > 0.1 || abs(knockback_y) > 0.1) {
    self.apply_movement(knockback_x, knockback_y);
    knockback_x *= 0.8;
    knockback_y *= 0.8;
}