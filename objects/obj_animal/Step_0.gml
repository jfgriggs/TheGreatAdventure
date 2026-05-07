// =============================================================================
// OBJECT:      obj_animal
// EVENT:       Step
// SYSTEM:      Animal Base Runtime Update
// =============================================================================

/// @description Updates shared animal AI, movement, targeting, and state-driven behavior for all animal child objects.
///
/// Child Objects:
/// - obj_animal_chicken
/// - obj_animal_cow
/// - obj_animal_sheep
/// - obj_animal_*
///
/// Responsibilities:
/// - Update animal state machine
/// - Process wandering behavior
/// - Handle follow targeting
/// - Validate line-of-sight
/// - Process eating behavior
/// - Handle pen/safe state checks
/// - Apply movement and collision
/// - Update animation state
///
/// Notes:
/// - AI behavior should remain state-driven
/// - Shared AI helpers belong in scr_ai_common
/// - Terrain-aware movement belongs in scr_movement
/// - Child objects should inherit shared behavior
/// - Avoid embedding complex AI logic directly here

// If game not playing stop
if (global.game_state != GAME_STATE.PLAYING) exit;

sm.update();

// Set animal sprite - use mask of sprite 3
mask_index = animal.sprite[3];
sprite_index = animal.sprite[face];

//// Already safe? skip
//if (safe) exit;

//// Check ALL pens
//var pen = instance_place(x, y, obj_pen);

//if (pen != noone) {

//    // ✅ ONLY ACCEPT CORRECT TYPE
//    if (pen.accepted_animal == animal_type) {

//        // Score
//        global.points += pen.score_value;
//        global.animals_saved++;

//        // Optional time bonus
//        var time_bonus = max(0, 300 - (global.game_time div global.target_fps));
//        global.points += time_bonus;

//        // Enter safe state
//        sm.change(Animal_Safe(sm));
//    }
//}


