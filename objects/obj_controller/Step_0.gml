// =============================================================================
// OBJECT:      obj_controller
// EVENT:       Step
// SYSTEM:      Core Game Controller
// =============================================================================

/// @description Handles high-level game state updates and transitions.
///
/// Responsibilities:
/// - Update global game states
/// - Handle pause/game over transitions
/// - Process fade transitions
/// - Manage restart/reset flow
/// - Update global timers
///
/// Notes:
/// - Gameplay-specific logic belongs in subsystem scripts
/// - Keep this event focused on orchestration

fade_alpha = lerp(fade_alpha, fade_target, fade_speed);

// snap when close (prevents endless tiny decimals)
if (abs(fade_alpha - fade_target) < 0.01) {
    fade_alpha = fade_target;
}

switch(global.game_state) {
	// =============================================================================
	// REGION: Start State
	// =============================================================================
	case GAME_STATE.STARTING:
	    if (keyboard_check_pressed(ord("B"))) {
			// reset room to spawn everything fresh
	        Game_Reset();
	        global.player_object = obj_player_ben;
			fade_target = 1;
	    }

	    if (keyboard_check_pressed(ord("L"))) {
			// reset room to spawn everything fresh
	        Game_Reset();
	        global.player_object = obj_player_leni;
			fade_target = 1;
	    }
		break;

	// =============================================================================
	// REGION: Playing State
	// =============================================================================
	case GAME_STATE.PLAYING:
	    // Pause / Quit prompt
	    if (keyboard_check_pressed(vk_escape)) {
			global.game_state = GAME_STATE.PAUSED;
			show_debug_message("global.game_state == GAME_STATE.PAUSED == " + string(global.game_state));
	    }

		// Time updates here (NOT in Create)
		global.game_time++;
		break;

	// =============================================================================
	// REGION: Pause State
	// =============================================================================
	case GAME_STATE.PAUSED:
		// YES → quit to start
	    if (keyboard_check_pressed(ord("Y"))) {
			global.game_state = GAME_STATE.STARTING;
			show_debug_message("global.game_state == GAME_STATE.STARTING == " + string(global.game_state));
	    }

	    // NO → resume game
	    if (keyboard_check_pressed(ord("N"))) {
			fade_target = 1;
	        global.game_state = GAME_STATE.PLAYING;
			show_debug_message("global.game_state == GAME_STATE.PLAYING == " + string(global.game_state));
			
	   }
	   break;

	// =============================================================================
	// REGION: Game Over State
	// =============================================================================
	case GAME_STATE.GAME_OVER:
		show_debug_message("global.game_state == GAME_STATE.GAME_OVER == " + string(global.game_state));
	    if (keyboard_check_pressed(ord("R"))) {
			global.game_state = GAME_STATE.STARTING;
			show_debug_message("global.game_state == GAME_STATE.PLAYING == " + string(global.game_state));
	    }
		break;
}		