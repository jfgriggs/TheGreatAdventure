// =============================================================================
// SCRIPT:      scr_game_utils
// TYPE:        Shared Utility Subsystem
// =============================================================================

/// @description Centralized shared utility functions used across gameplay systems and runtime subsystems.
///
/// Responsibilities:
/// - Mouse/world coordinate helpers
/// - Shared math/vector utilities
/// - General gameplay helper functions
/// - Common validation helpers
/// - Reusable lightweight utility logic
///
/// Public API:
/// - Mouse_GetWorldX()
/// - Mouse_GetWorldY()
/// - Screen_Shake()
/// - Spare_Spawn()
/// - Game_Reset()
///
/// Notes:
/// - Keep functions lightweight and reusable
/// - Avoid subsystem-specific gameplay logic here
/// - Larger systems should remain in dedicated subsystem scripts
/// - Prevent duplication of common helper logic

function Mouse_GetWorldX() {
    var cam = view_camera[0];
    return camera_get_view_x(cam) + (window_mouse_get_x() / window_get_width()) * camera_get_view_width(cam);
}

function Mouse_GetWorldY() {
    var cam = view_camera[0];
    return camera_get_view_y(cam) + (window_mouse_get_y() / window_get_height()) * camera_get_view_height(cam);
}

function Screen_Shake(amount, duration) {
	var c = obj_controller;
	
	if (instance_exists(c)) {
		c.shake_strength = amount;
		c.shake_timer = duration;
	}
}

function Spark_Spawn(_x, _y) {

    if (!instance_exists(obj_controller)) return;

    var ps = obj_controller.ps;
    var pt = obj_controller.pt_spark;

	// Core burst
    part_particles_create(ps, _x, _y, pt, 40);
	
	// Outer burst (slightly offset)
	part_particles_create(ps, _x + random_range(-6,6), _y + random_range(-6, 6), pt, 20);
}

function Game_Reset() {

	// Reset globals
	global.points = 0;
    global.animals_saved = 0;
    global.game_time = 0;

    // Reset player
    var p = obj_player;

    if (instance_exists(p)) {
        p.x = p.spawn_x;
		p.y = p.spawn_y;

        p.hp = 100;
        p.is_dead = false;

        p.invincible_timer = 0;

        p.knockback_x = 0;
        p.knockback_y = 0;

        p.trap_timer = 0;
    }

    //// Reset enemies (simple version)
    //with (obj_enemy) {
    //    instance_destroy();
    //}

    //// Reset animals
    //with (obj_animal) {
    //    instance_destroy();
    //}

    // (Optional) respawn logic goes here
}