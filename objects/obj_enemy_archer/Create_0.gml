// ===========================================================================
// OBJECT:       obj_enemy_archer
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Enemy Archer Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures an archer with health, vision and attack ranges, fire timing, projectile object, inventory, and sprite set after inherited setup.
//
// ===========================================================================

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

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
