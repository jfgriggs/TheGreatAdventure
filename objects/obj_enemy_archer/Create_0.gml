// =============================================================================
// OBJECT:      obj_enemy_archer
// EVENT:       Create
// SYSTEM:      Enemy Configuration
// =============================================================================

/// @description Configures archer-specific enemy data, combat behavior, and AI tuning.
///
/// Parent Object:
/// - obj_enemy_parent
///
/// Responsibilities:
/// - Assign enemy type
/// - Configure archer data struct
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

apply_movement = function(_vx, _vy) {
    var o = self;
};