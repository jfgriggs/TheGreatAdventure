fade_alpha = lerp(fade_alpha, fade_target, fade_speed);

// snap when close (prevents endless tiny decimals)
if (abs(fade_alpha - fade_target) < 0.01) {
    fade_alpha = fade_target;
}

// =========================
// START SCREEN
// =========================
if (game_state == GAME_STATE.START) {
    if (keyboard_check_pressed(vk_space)) {
        // reset room to spawn everything fresh
        game_reset();

		fade_target = 1;
		game_state = GAME_STATE.PLAYING;
    }
}


// =========================
// PLAYING
// =========================
else if (game_state == GAME_STATE.PLAYING) {
    // Pause / Quit prompt
    if (keyboard_check_pressed(vk_escape)) {
        game_state = GAME_STATE.PAUSED;
    }

	// Time updates here (NOT in Create)
	global.game_time++;
}


// =========================
// PAUSED (QUIT CONFIRM)
// =========================
else if (game_state == GAME_STATE.PAUSED) {
    // YES → quit to start
    if (keyboard_check_pressed(ord("Y"))) {
        game_reset();
		fade_target = 1;
		game_state = GAME_STATE.START;
    }

    // NO → resume game
    if (keyboard_check_pressed(ord("N"))) {
		fade_target = 1;
        game_state = GAME_STATE.PLAYING;
   }
}

// =========================
// GAME OVER
// =========================
else if (game_state == GAME_STATE.GAME_OVER) {
    if (keyboard_check_pressed(ord("R"))) {
        game_reset();
		fade_target = 1;
		game_state = GAME_STATE.PLAYING;
    }
}