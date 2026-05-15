// =============================================================================
// OBJECT:      obj_animal_chicken
// EVENT:       Create
// SYSTEM:      Chicken Configuration
// =============================================================================

/// @description Configures chicken-specific gameplay tuning.
///
/// Parent Object:
/// - obj_animal
///
/// Responsibilities:
/// - Assign chicken animal identity
/// - Configure chicken movement tuning
/// - Configure chicken AI tuning
/// - Configure preferred food
/// - Configure chicken visuals
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

animal_type = ANIMAL.CHICKEN;


/// =========================
/// GAMEPLAY
/// =========================

point_value = 50;


/// =========================
/// MOVEMENT
/// =========================

move_speed = 0.25;
wander_speed = move_speed;


/// =========================
/// AI
/// =========================

vision_range = 180;
lose_range = 220;
lose_time_max = Seconds(4);

desired_items = [
    ITEM.CORN
];


/// =========================
/// VISUALS
/// =========================

sprite_set = [
    spr_animal_chicken_right,
    spr_animal_chicken_up,
    spr_animal_chicken_left,
    spr_animal_chicken_down
];

sprite_large = spr_animal_chicken_large;


/// =========================
/// INITIAL VISUAL SETUP
/// =========================

mask_index = sprite_set[3];
sprite_index = sprite_set[3];