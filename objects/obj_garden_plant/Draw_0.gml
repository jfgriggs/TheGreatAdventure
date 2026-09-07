// ===========================================================================
// OBJECT:       obj_garden_plant
// EVENT:        Draw
// REVISION:     1.0.0
// SYSTEM:       Garden Plant Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Draws the plant using its current sprite and growth image so its visual stage is visible in the room.
//
// ===========================================================================

draw_self();

//// --------------------------------------------------
//// Debug Information
//// --------------------------------------------------

//var _progress = growth_timer / growth_time;

//// Text formatting.
//draw_set_font(fnt_debug_small);
//draw_set_halign(fa_center);
//draw_set_valign(fa_bottom);
//draw_set_color(c_white);

//// Growth stage.
//draw_text(x, y - 48,
//    "frame: " + string(image_index));

//// Timer values.
//draw_text(x, y - 32,
//    "timer: " + string(growth_timer));

//draw_text(x, y - 16,
//    "time: " + string(growth_time));

//// Progress percentage.
//draw_text(x, y,
//    "progress: " + string_format(_progress, 1, 2)); 

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
