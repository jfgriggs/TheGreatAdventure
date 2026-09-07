// ===========================================================================
// OBJECT:       obj_hud
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Hud Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Creates HUD drawing helper functions for panels and rounded panels.
//
// ===========================================================================

/// @function draw_panel_fn
/// @description Handles draw panel fn for this file's subsystem.
/// @param {Any} x1 Input used by draw_panel_fn.
/// @param {Any} y1 Input used by draw_panel_fn.
/// @param {Any} x2 Input used by draw_panel_fn.
/// @param {Any} y2 Input used by draw_panel_fn.
/// @param {Any} alpha Input used by draw_panel_fn.
/// @returns {void} The result of the operation, when it produces one.
draw_panel_fn = function(x1, y1, x2, y2, alpha) {
	draw_set_color(c_black);
	draw_set_alpha(alpha);
	draw_rectangle(x1, y1, x2, y2, false);
	draw_set_alpha(1);
};

/// @function draw_panel_rounded_fn
/// @description Handles draw panel rounded fn for this file's subsystem.
/// @param {Any} x1 Input used by draw_panel_rounded_fn.
/// @param {Any} y1 Input used by draw_panel_rounded_fn.
/// @param {Any} x2 Input used by draw_panel_rounded_fn.
/// @param {Any} y2 Input used by draw_panel_rounded_fn.
/// @param {Any} radius Input used by draw_panel_rounded_fn.
/// @param {Any} alpha Input used by draw_panel_rounded_fn.
/// @returns {void} The result of the operation, when it produces one.
draw_panel_rounded_fn = function(x1, y1, x2, y2, radius, alpha) {
	draw_set_alpha(alpha);

	// Clamp radius so it doesn't break
	//var max_r_x = (x2 - x1) / 2;
	//var max_r_y = (y2 - y1) / 2;

	//var r = min(radius, max_r_x, max_r_y);

	// Center rectangles
	//    draw_rectangle(x1 + r, y1, x2 - r, y2, false);
	//    draw_rectangle(x1, y1 + r, x2, y2 - r, false);
	draw_roundrect_ext(x1, y1, x2, y2, radius, radius, false);

	// Corners (circles)
	//draw_circle(x1 + r, y1 + r, r, false);
	//draw_circle(x2 - r, y1 + r, r, false);
	//draw_circle(x1 + r, y2 - r, r, false);
	//draw_circle(x2 - r, y2 - r, r, false);

	draw_set_alpha(1);
};

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
