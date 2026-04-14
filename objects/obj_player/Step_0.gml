// File: obj_player.gml
// Event: step

//show_debug_message("game_state=" + string(global.game_state)
//	+ " start=" +  string(GAME_STATE.START)
//	+ " playing=" +  string(GAME_STATE.PLAYING)
//	+ " paused=" +  string(GAME_STATE.PAUSED)
//	+ " game_over=" +  string(GAME_STATE.GAME_OVER)
//);

// If game not playing stop
if (global.game_state != GAME_STATE.PLAYING) {
    exit;
}

/// =========================
/// INPUT (MUST BE FIRST)
/// =========================
input_x = keyboard_check(vk_right) - keyboard_check(vk_left);
input_y = keyboard_check(vk_down) - keyboard_check(vk_up);

input_attack = mouse_check_button_pressed(mb_left);
input_throw = mouse_check_button_pressed(mb_right);

// Store previous position BEFORE movement
prev_x = x;
prev_y = y;

// Get move direction
move_dir = point_direction(0, 0, input_x, input_y);
	
var input_level = point_distance(0,  0, input_x, input_y);
input_level = clamp(input_level, 0, 1);
move_speed = move_speed_default * input_level;
	
// Depth
//depth = -bbox_bottom;
depth = -y;


/// =========================
/// STATE MACHINE
/// =========================
if (sm != undefined) {
    sm.update();
} else {
    show_debug_message("ERROR: sm undefined in obj_player");
}


/// =========================
/// COOLDOWNS
/// =========================
if (weapon_cooldown > 0) weapon_cooldown--;


/// =========================
/// INVINCIBILITY
/// =========================
if (invincible_timer > 0) invincible_timer--;


/// =========================
/// KNOCKBACK
/// =========================
if (abs(knockback_x) > 0.1 || abs(knockback_y) > 0.1) {
    move_and_collide_fn(knockback_x, knockback_y);

    knockback_x *= 0.8;
    knockback_y *= 0.8;
}


/// =========================
/// FLASH / BLINK
/// =========================
if (teleport_timer > 0) {
	if (teleport_timer mod 4 == 0) {
		flash_visible = !flash_visible;
	}
} else if (flash_timer > 0) {
	show_debug_message("flash_timer=" + string(flash_timer) + " flash_visible=" + string(flash_visible));
    flash_timer--;

	// toggle visibility
	if (flash_timer mod flash_interval == 0) {
		flash_visible = !flash_visible;
	}
} else {
	flash_visible = true;
}


/// =========================
/// TRAP
/// =========================
var tile = tile_get(x, y);
if (tile == TILE.TRAP) {
    if (trap_timer <= 0) {
        apply_damage(id, 10, id);
        trap_timer = trap_cooldown;
    }
}

// countdown
if (trap_timer > 0) {
    trap_timer--;
}

/// =========================
/// AIM (MOUSE)
/// =========================
center_y = y - center_y_offset;
aim_dir = point_direction(x, center_y, mouse_x, mouse_y);


/// =========================
/// SPRITE
/// =========================
// Make sure the sprite is facing direction of mouse
face = round(aim_dir/90);
if face == 4 face = 0;
	
// Stop animating
if input_x == 0 && input_y == 0 {
	image_index = 0
}
	
// Set player sprite - use mask of sprite 3
mask_index = sprite[3];
sprite_index = sprite[face];


/// =========================
/// WEAPON SWITCH
/// =========================
if (keyboard_check_pressed(vk_space)) {
    weapon_index = (weapon_index + 1) mod ds_list_size(weapons);
    weapon = weapons[| weapon_index];
}


/// =========================
/// ITEM SWITCH
/// =========================
if (keyboard_check_pressed(vk_tab)) {
    active_item_index = (active_item_index + 1) mod ds_list_size(inventory);
    active_item = inventory[| active_item_index];
}