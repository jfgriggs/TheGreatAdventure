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
///
/// Notes:
/// - AI behavior should remain state-driven
/// - Child objects should inherit shared behavior
/// - Avoid embedding complex AI logic directly here

// If game not playing stop
if (global.game_state != GAME_STATE.PLAYING) {
	exit;
}

/// =========================================================
/// Flash Timer
/// =========================================================

if (flash_timer > 0) {
	flash_timer--;
}

/// =========================================================
/// Flee Runtime
/// =========================================================

if (flee_timer > 0)
{
    flee_timer--;

    var panic_time = flee_time * 0.80;

    if (flee_timer > (flee_time - panic_time))
    {
        // Initial panic burst.
        flee_speed_current = flee_speed_multiplier;
    }
    else
    {
        // Gradually calm down.
        var t = flee_timer / (flee_time - panic_time);

        flee_speed_current = lerp(
            1.0,
            flee_speed_multiplier,
            t
        );
    }

    movement_speed_multiplier = flee_speed_current;
}
else
{
    flee_speed_current = 1.0;
    movement_speed_multiplier = 1.0;
}


/// =========================================================
/// CLEAR MOVEMENT INTENT
/// =========================================================
move_input_x = 0;
move_input_y = 0;

/// =========================================================
/// STATE MACHINE
/// =========================================================
sm.update();

/// =========================================================
/// SAFE AREA CHECK
/// =========================================================
is_safe = Animal_IsSafe(self);

/// =========================================================
/// SHARED MOVEMENT
/// =========================================================
//show_debug_message(
//    "flee_speed_multiplier=" + string(flee_speed_multiplier)
//    + " current=" + string(flee_speed_current)
//    + " multiplier=" + string(movement_speed_multiplier)
//    + " max=" + string(max_speed)
//);

Movement_Update(self);

/// =========================================================
/// DEPTH SORTING
/// =========================================================
depth = -y;
