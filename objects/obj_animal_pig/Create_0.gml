// =============================================================================
// OBJECT:      obj_animal_pig
// EVENT:       Create
// SYSTEM:      Pig Configuration
// =============================================================================

/// @description Configures pig-specific gameplay tuning.
///
/// Parent Object:
/// - obj_animal
///
/// Responsibilities:
/// - Assign pig animal identity
/// - Configure pig movement tuning
/// - Configure pig AI tuning
/// - Configure preferred food
/// - Configure pig visuals
///
/// Notes:
/// - Shared AI logic belongs in scr_animal_states
/// - Shared movement logic belongs in scr_movement
/// - Shared runtime behavior belongs in obj_animal
/// - This object should only configure species-specific values

event_inherited();


/// =========================
/// IDENTITY
/// =========================

animal_type = ANIMAL.PIG;


/// =========================
/// GAMEPLAY
/// =========================

point_value = 125;


/// =========================
/// MOVEMENT
/// =========================

move_speed = 1.2;
wander_speed = 0.8;

wander_move_time_min = 15;
wander_move_time_max = 45;

wander_idle_time_min = 10;
wander_idle_time_max = 30;


/// =========================
/// AI
/// =========================

vision_range = 240;
lose_range = 300;
lose_time_max = Seconds(5);

desired_items = {
    carrot : 2,
    corn   : 2,
    tomato : 4,
	pumpkin: 1,
	watermelon: 1
};


/// =========================
/// VISUALS
/// =========================

sprite_set = [
    spr_animal_pig_right,
    spr_animal_pig_up,
    spr_animal_pig_left,
    spr_animal_pig_down
];

sprite_large = spr_animal_pig_large;


/// =========================
/// INITIAL VISUAL SETUP
/// =========================

mask_index = sprite_set[3];
sprite_index = sprite_set[3];