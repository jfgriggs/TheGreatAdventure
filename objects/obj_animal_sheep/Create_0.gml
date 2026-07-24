// =============================================================================
// OBJECT:      obj_animal_sheep
// EVENT:       Create
// SYSTEM:      Animal Configuration
// =============================================================================

/// @description Configures sheep-specific animal data and behavior.
///
/// Parent Object:
/// - obj_animal
///
/// Responsibilities:
/// - Assign sheep animal type
/// - Configure animal data struct
/// - Setup sheep-specific properties
/// - Configure movement/AI tuning
/// - Initialize sheep visuals/animation settings
///
/// Notes:
/// - Inherits shared animal behavior from obj_animal (parent)
/// - Shared AI logic belongs in scr_animal_states
/// - Avoid duplicating shared animal logic here

event_inherited();

/// =========================
/// IDENTITY
/// =========================

animal_type = ANIMAL.SHEEP;

/// =========================
/// GAMEPLAY
/// =========================

point_value = 100;

/// =========================
/// MOVEMENT
/// =========================

move_speed = 1.2;
wander_speed = 0.8;

wander_move_time_min = 15;
wander_move_time_max = 45;

wander_idle_time_min = 10;
wander_idle_time_max = 30;

tile_check_safe      = Tile_Is_Animal_Sheep_Pasture;
tile_check_blocking  = Tile_Is_Blocking_Animal;

/// =========================
/// AI
/// =========================

vision_range = 220;
lose_range = 260;
lose_time_max = 180;

desired_items = {carrot: 1, corn: 2};

// Once this animal reaches its designated safe area,
// movement will prevent it from leaving.
stay_in_safe_area = true;

/// =========================
/// VISUALS
/// =========================

sprite_set = [
	spr_animal_sheep_right,
	spr_animal_sheep_up,
	spr_animal_sheep_left,
	spr_animal_sheep_down
];

sprite_large = spr_animal_sheep_large;

/// =========================
/// INITIAL VISUAL SETUP
/// =========================

mask_index = sprite_set[3];
sprite_index = sprite_set[3];
