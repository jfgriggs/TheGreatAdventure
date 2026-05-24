/// =============================================================================
/// OBJECT:      obj_animal
/// EVENT:       Draw
/// DESCRIPTION:
///     Draws the animal with runtime visual feedback.
///
/// RESPONSIBILITIES:
///     - draw directional animal sprite
///     - tint safe animals
///     - preserve animation playback
///     - reset draw state afterward
///
/// SAFE VISUALS:
///     Animals inside their correct pen are tinted green
///     using image_blend.
///
/// NOTES:
///     Gameplay logic remains centralized elsewhere:
///
///     - AI/state machine       -> scr_animal_states
///     - movement/collision     -> apply_movement()
///     - tile logic             -> scr_tiles
///     - safety detection       -> Animal_IsSafe()
///
///     This Draw Event is presentation-only.
/// =============================================================================

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
