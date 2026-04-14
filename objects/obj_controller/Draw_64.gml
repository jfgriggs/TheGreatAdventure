// File: obj_controller.gml
// Event: draw gui

var cx = display_get_gui_width() / 2;
var cy = display_get_gui_height() / 2;

// =========================
// START SCREEN
// =========================
if (global.game_state == GAME_STATE.START) {
	draw_set_color(c_black);
	draw_set_alpha(fade_alpha);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

	if (fade_alpha > 0.8) {
		draw_set_alpha(1);
		
		draw_set_font(fnt_large);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		
		draw_set_color(c_yellow);
		draw_text(cx, cy - 70, "PRESS SPACE");

		draw_set_color(c_white);
		draw_text(cx, cy + 70, "TO START");
	}
}


// =========================
// PAUSE / QUIT SCREEN
// =========================
else if (global.game_state == GAME_STATE.PAUSED) {
	draw_set_color(c_black);
	draw_set_alpha(fade_alpha);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

	if (fade_alpha > 0.8) {
		draw_set_alpha(1);
		
		draw_set_font(fnt_large);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		
		draw_set_color(c_yellow);
	    draw_text(cx, cy - 70, "QUIT GAME?");
		
		draw_set_color(c_white);
		draw_text(cx, cy + 70, "Y = YES   N = NO");
	}
}


// =========================
// GAME OVER
// =========================
else if (global.game_state == GAME_STATE.GAME_OVER) {
	draw_set_color(c_black);
	draw_set_alpha(fade_alpha);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

	if (fade_alpha > 0.8) {
		draw_set_alpha(1);
		
		draw_set_font(fnt_large);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		
		draw_set_color(c_yellow);
	    draw_text(cx, cy - 70, "GAME OVER");

		draw_set_color(c_white);
		draw_text(cx, cy + 70, "Press R to Restart");
	}
}
