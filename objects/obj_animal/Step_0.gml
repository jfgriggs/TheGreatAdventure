// File: obj_animal.gml
// Event: step

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
//        var time_bonus = max(0, 300 - (global.game_time div global.FPS));
//        global.points += time_bonus;

//        // Enter safe state
//        sm.change(Animal_Safe(sm));
//    }
//}


