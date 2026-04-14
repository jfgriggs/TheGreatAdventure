// File: obj_controller.gml
// Event: step

fade_alpha = lerp(fade_alpha, fade_target, fade_speed);

// snap when close (prevents endless tiny decimals)
if (abs(fade_alpha - fade_target) < 0.01) {
    fade_alpha = fade_target;
}

switch(global.game_state) {
	// =========================
	// START SCREEN
	// =========================
	case GAME_STATE.START:
		if (keyboard_check_pressed(vk_space)) {
			show_debug_message("global.game_state == GAME_STATE.START == " + string(global.game_state));
	        // reset room to spawn everything fresh
	        game_reset();

			fade_target = 1;
			global.game_state = GAME_STATE.PLAYING;
	    }
		break;

	// =========================
	// PLAYING
	// =========================
	case GAME_STATE.PLAYING:
	    // Pause / Quit prompt
	    if (keyboard_check_pressed(vk_escape)) {
			show_debug_message("global.game_state == GAME_STATE.PLAYING == " + string(global.game_state));
	        global.game_state = GAME_STATE.PAUSED;
	    }

		// Time updates here (NOT in Create)
		global.game_time++;
		break;

	// =========================
	// PAUSED (QUIT CONFIRM)
	// =========================
	case GAME_STATE.PAUSED:
		show_debug_message("global.game_state == GAME_STATE.PAUSED == " + string(global.game_state));
	    // YES → quit to start
	    if (keyboard_check_pressed(ord("Y"))) {
	        game_reset();
			fade_target = 1;
			global.game_state = GAME_STATE.START;
	    }

	    // NO → resume game
	    if (keyboard_check_pressed(ord("N"))) {
			fade_target = 1;
	        global.game_state = GAME_STATE.PLAYING;
	   }
	   break;

	// =========================
	// GAME OVER
	// =========================
	case GAME_STATE.GAME_OVER:
		show_debug_message("global.game_state == GAME_STATE.GAME_OVER == " + string(global.game_state));
	    if (keyboard_check_pressed(ord("R"))) {
	        game_reset();
			fade_target = 1;
			global.game_state = GAME_STATE.PLAYING;
	    }
		break;
}		