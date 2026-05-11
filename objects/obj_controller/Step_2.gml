// =============================================================================
// OBJECT:      obj_controller
// EVENT:       End Step
// SYSTEM:      Camera System
// =============================================================================

/// @description Updates camera positioning and post-movement effects.
///
/// Responsibilities:
/// - Smooth camera follow
/// - Camera interpolation
/// - Screen shake handling
/// - Final camera positioning
///
/// Notes:
/// - Runs after entity movement is finalized
/// - Camera effects should be applied here

// Camera follow

/// =========================
/// DEFERRED PLAYER SPAWN
/// =========================
if (spawn_player_pending) {
    spawn_player_pending = false;
	instance_create_layer(global.player_spawn_x, global.player_spawn_y, "Instances", global.player_object);
}

if (!is_undefined(global.player_object)) {
	var p = instance_find(global.player_object, 0);

	if (p != noone) {
		var cam = view_camera[0];

		var cam_w = camera_get_view_width(cam);
		var cam_h = camera_get_view_height(cam);

		// =========================
		// TARGET (PLAYER)
		// =========================
		var target_x = p.x - cam_w / 2;
		var target_y = p.y - cam_h / 2;

		// =========================
		// CURRENT CAMERA
		// =========================
		var cx = camera_get_view_x(cam);
		var cy = camera_get_view_y(cam);

		// =========================
		// SMOOTH FOLLOW
		// =========================
		cx = lerp(cx, target_x, 0.1);
		cy = lerp(cy, target_y, 0.1);

		// =========================
		// SCREEN SHAKE (APPLY LAST)
		// =========================
		if (shake_timer > 0) {

		    shake_timer--;

		    cx += random_range(-shake_strength, shake_strength);
		    cy += random_range(-shake_strength, shake_strength);

		    // decay
		    shake_strength *= 0.9;
		}

		// =========================
		// APPLY CAMERA
		// =========================
		camera_set_view_pos(cam, cx, cy);
	}
}