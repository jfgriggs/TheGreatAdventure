// ===========================================================================
// OBJECT:       obj_animal
// EVENT:        Draw
// REVISION:     1.0.0
// SYSTEM:       Animal Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Draws the animal sprite and its visual state, including direction or status presentation used by the shared animal object.
//
// ===========================================================================

if (flash_timer > 0) {
	image_blend = c_red;
} else {
	image_blend = c_white;
}

// =========================================================
// SAFE GLOW
// =========================================================
if (is_safe) {
	var glow_pulse = 0.45 + sin(current_time / 120) * 0.15;

	gpu_set_blendmode(bm_add);

	draw_sprite_ext(
		sprite_index,
		image_index,
		x,
		y + 3,
		1.25,
		1.25,
		image_angle,
		c_lime,
		glow_pulse
	);

	gpu_set_blendmode(bm_normal);
}

// =========================================================
// NORMAL SPRITE
// =========================================================
draw_self();

image_blend = c_white;

// =========================================================
// SAFE HIGHLIGHT
// =========================================================
if (is_safe) {
	var highlight_pulse = 0.45 + sin(current_time / 100) * 0.15;

	gpu_set_blendmode(bm_add);

	draw_sprite_ext(
		sprite_index,
		image_index,
		x,
		y,
		image_xscale * 1.05,
		image_yscale * 1.05,
		image_angle,
		make_color_rgb(180, 255, 180),
		highlight_pulse
	);

	gpu_set_blendmode(bm_normal);
}

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
