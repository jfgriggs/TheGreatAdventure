// =============================================================================
// OBJECT:      obj_animal_cow
// EVENT:       Create
// SYSTEM:      Cow Configuration
// =============================================================================

/// @description Configures cow-specific gameplay tuning.
///
/// Parent Object:
/// - obj_animal
///
/// Responsibilities:
/// - Assign cow animal identity
/// - Configure cow movement tuning
/// - Configure cow AI tuning
/// - Configure preferred food
/// - Configure cow visuals
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

animal_type = ANIMAL.COW;


/// =========================
/// GAMEPLAY
/// =========================

point_value = 150;


/// =========================
/// MOVEMENT
/// =========================

move_speed = 0.18;
wander_speed = move_speed;


/// =========================
/// AI
/// =========================

vision_range = 260;
lose_range = 320;
lose_time_max = Seconds(5);

desired_items = [
    ITEM.CARROT,
    ITEM.CORN
];


/// =========================
/// VISUALS
/// =========================

sprite_set = [
    spr_animal_cow_right,
    spr_animal_cow_up,
    spr_animal_cow_left,
    spr_animal_cow_down
];

sprite_large = spr_animal_cow_large;


/// =========================
/// INITIAL VISUAL SETUP
/// =========================

mask_index = sprite_set[3];
sprite_index = sprite_set[3];