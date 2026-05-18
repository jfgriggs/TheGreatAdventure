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

animal_type = ANIMAL.SHEEP;

move_speed = 1.2;
wander_speed = 0.8;

wander_move_time_min = 15;
wander_move_time_max = 45;

wander_idle_time_min = 10;
wander_idle_time_max = 30;

point_value = 100;

vision_range = 220;
lose_range = 260;
lose_time_max = 180;

desired_items = {
    carrot : 1,
    corn   : 2
};

sprite_set = [
    spr_animal_sheep_right,
    spr_animal_sheep_up,
    spr_animal_sheep_left,
    spr_animal_sheep_down
];

sprite_large = spr_animal_sheep_large;

mask_index = sprite_set[3];
sprite_index = sprite_set[3];
