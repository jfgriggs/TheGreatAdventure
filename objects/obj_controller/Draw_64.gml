// ===========================================================================
// OBJECT:       obj_controller
// EVENT:        Draw
// REVISION:     1.0.0
// SYSTEM:       Controller Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Draws controller-owned debug or world overlay information in the Draw GUI stage.
//
// ===========================================================================

var cx = display_get_gui_width() / 2;
var cy = display_get_gui_height() / 2;

// =============================================================================
// REGION: Start Screen
// =============================================================================
if (global.game_state == GAME_STATE.STARTING) {
	draw_set_color(c_black);
	draw_set_alpha(fade_alpha);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

	if (fade_alpha > 0.8) {
		draw_set_alpha(1);

		draw_set_font(fnt_large);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);

		draw_set_color(c_white);
		draw_text(cx, cy - 210, "TO START");

		draw_set_color(c_blue);
		draw_text(cx, cy - 70, "PRESS 'B' for Ben");

		draw_set_color(c_yellow);
		draw_text(cx, cy + 70, "PRESS 'L' for Leni");
	}
} else if (global.game_state == GAME_STATE.PAUSED) {
	// ============================================================================= // REGION: Pause / Quit Screen // =============================================================================
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
} else if (global.game_state == GAME_STATE.GAME_OVER) {
	// ============================================================================= // REGION: Game Over Screen // =============================================================================
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

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
