// ===========================================================================
// SCRIPT:       scr_game_utils
// REVISION:     1.0.0
// SYSTEM:       Game Utils System
// ARCHITECTURE: Shared Game Utils System
//
// DESCRIPTION:
// Provides small reusable game helpers, including time conversion, random or selection utilities, and general value operations used by gameplay systems.
//
// ===========================================================================

/// @function Mouse_GetWorldX
/// @description Handles mouse getworldx for this file's subsystem.
/// @returns {Any} The result of the operation, when it produces one.
function Mouse_GetWorldX() {
	var cam = view_camera[0];
	return camera_get_view_x(cam)
		+ (window_mouse_get_x() / window_get_width()) * camera_get_view_width(cam);
}

/// @function Mouse_GetWorldY
/// @description Handles mouse getworldy for this file's subsystem.
/// @returns {Any} The result of the operation, when it produces one.
function Mouse_GetWorldY() {
	var cam = view_camera[0];
	return camera_get_view_y(cam)
		+ (window_mouse_get_y() / window_get_height()) * camera_get_view_height(cam);
}

/// @function Screen_Shake
/// @description Handles screen shake for this file's subsystem.
/// @param {Any} amount Input used by Screen_Shake.
/// @param {Any} duration Input used by Screen_Shake.
/// @returns {void} The result of the operation, when it produces one.
function Screen_Shake(amount, duration) {
	var c = obj_controller;

	if (instance_exists(c)) {
		c.shake_strength = amount;
		c.shake_timer = duration;
	}
}

/// @function Spark_Spawn
/// @description Handles spark spawn for this file's subsystem.
/// @param {Any} _x Input used by Spark_Spawn.
/// @param {Any} _y Input used by Spark_Spawn.
/// @returns {Any} The result of the operation, when it produces one.
function Spark_Spawn(_x, _y) {
	if (!instance_exists(obj_controller)) {
		return;
	}

	var ps = obj_controller.ps;
	var pt = obj_controller.pt_spark;

	// Core burst
	part_particles_create(ps, _x, _y, pt, 40);

	// Outer burst (slightly offset)
	part_particles_create(ps, _x + random_range(-6, 6), _y + random_range(-6, 6), pt, 20);
}

/// @function Game_Reset
/// @description Handles game reset for this file's subsystem.
/// @returns {void} The result of the operation, when it produces one.
function Game_Reset() {
	/// -------------------------
	/// RESET GAME STATE
	/// -------------------------
	global.game_state = GAME_STATE.PLAYING;

	room_restart();
}

/// @function Seconds
/// @description Handles seconds for this file's subsystem.
/// @param {Any} _seconds Input used by Seconds.
/// @returns {Any} The result of the operation, when it produces one.
function Seconds(_seconds) {
	return round(game_get_speed(gamespeed_fps) * _seconds);
}

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
