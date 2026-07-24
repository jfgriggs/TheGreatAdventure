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

// =============================================================================
// OBJECT:      obj_enemy_archer
// EVENT:       Create
// =============================================================================

event_inherited();

/// =========================================================
/// IDENTITY
/// =========================================================

enemy_type = ENEMY.ARCHER;

/// =========================================================
/// STATS
/// =========================================================

hp_max = 6;
hp = hp_max;

move_speed = 1.0;

vision_range = 320;
lose_range = 380;

attack_range = 220;

attack_damage = 2;

attack_rate = Seconds(2);

/// =========================================================
/// COMBAT
/// =========================================================

uses_projectiles = true;

projectile_object = obj_projectile_arrow;

/// =========================================================
/// LOOT
/// =========================================================

can_pickup_treasure = true;

inventory = Enemy_Inventory_Create();

/// =========================================================
/// VISUALS
/// =========================================================

sprite_set = [
	spr_enemy_archer_right,
	spr_enemy_archer_up,
	spr_enemy_archer_left,
	spr_enemy_archer_down
];

mask_index = sprite_set[3];
sprite_index = sprite_set[3];
