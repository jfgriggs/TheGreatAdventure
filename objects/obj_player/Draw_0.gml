// File: obj_player.gml
// Event: draw

// Red flash + blink combo
if (flash_timer > 0 && !flash_visible) {
//	draw_set_color(c_red);
	image_blend = c_purple;
	image_alpha = 0.5 + 0.5 * sin(current_time / 50);
} else {
//	draw_set_color(c_white);
	image_blend = c_white;
	image_alpha = 1;
}

if (teleport_timer > 0) {
	image_alpha = 0.5 + 0.5 * sin(current_time / 50);
} else {
	image_alpha = 1;
}

/// =========================
/// DEFAULT DRAW
/// =========================
draw_self();

// Reset (important!)
image_alpha = 1;
image_blend = c_white;


/// =========================
/// DEBUG (REMOVE LATER)
/// =========================
draw_set_font(fnt_debug_small);
draw_set_color(c_white);

//draw_text(x - 40, y - 75, "State: " + string(sm.current));
draw_text(x - 40, y - 55, "Input: " + string(input_x) + "," + string(input_y));
draw_text(x - 40, y - 45, "Move: " + string(input_x) + "," + string(input_y) + "," + string(move_dir) + "," + string(move_speed));
draw_text(x - 40, y - 35, "HP: " + string(hp));
draw_text(x - 40, y - 25, "Wpn: " + string(weapon.name));

if (variable_instance_exists(id, "active_item")) {
	draw_text(x - 40, y - 15, "Item: " + string(active_item));
}
