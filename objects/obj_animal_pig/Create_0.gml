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

move_speed = 0.22;
wander_speed = move_speed;


/// =========================
/// AI
/// =========================

vision_range = 240;
lose_range = 300;
lose_time_max = Seconds(5);

desired_items = [
    ITEM.CORN,
    ITEM.CARROT
];


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