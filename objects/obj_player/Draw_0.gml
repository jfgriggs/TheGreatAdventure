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
draw_set_color(c_white);
draw_set_font(fnt_normal);

/// =========================
/// DEBUG (REMOVE LATER)
/// =========================

// State
draw_text(x - 40, y - 75, "State: " + string(sm.current));

// Input
draw_text(x - 40, y - 60, "Input: " + string(input_x) + "," + string(input_y));

// Movement
draw_text(x - 40, y - 45, "Move: " + string(input_x) + "," + string(input_y) + "," + string(move_dir) + "," + string(move_speed));

// HP
draw_text(x - 40, y - 30, "HP: " + string(hp));

// Weapon
draw_text(x - 40, y - 15, "Wpn: " + string(weapon.name));
