// =============================================================================
// OBJECT:      obj_player
// EVENT:       Step
// SYSTEM:      Player Runtime Update
// =============================================================================

/// @description Handles per-frame player updates and delegates behavior to shared systems and player states.
///
/// Responsibilities:
/// - Update player state machine
/// - Process movement input
/// - Process aiming input
/// - Handle attack/throw input
/// - Apply movement and collision
/// - Update terrain interactions
/// - Update animation state
///
/// Notes:
/// - State-specific behavior belongs in scr_player_states
/// - Avoid embedding complex gameplay logic directly here

// If game not playing stop
if (global.game_state != GAME_STATE.PLAYING) {
	exit;
}

/// =========================
/// INPUT (MUST BE FIRST)
/// =========================

if (control_locked) {
	input_x = 0;
	input_y = 0;

	move_input_x = 0;
	move_input_y = 0;

	input_attack = false;
	input_throw = false;

	input_switch_item = false;
	input_switch_weapon = false;
} else {
	input_x = keyboard_check(vk_right) - keyboard_check(vk_left);
	input_y = keyboard_check(vk_down) - keyboard_check(vk_up);

	input_attack = mouse_check_button_pressed(mb_left);
	input_throw = mouse_check_button_pressed(mb_right);

	input_switch_item = keyboard_check_pressed(vk_tab);
	input_switch_weapon = keyboard_check_pressed(vk_space);
}

// Get move direction

move_input_x = input_x;
move_input_y = input_y;

max_speed = move_speed_default;

// Store previous position BEFORE movement
prev_x = x;
prev_y = y;

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
/// MOVEMENT
/// =========================
apply_movement();

/// =========================
/// INVINCIBILITY
/// =========================
if (invincible_timer > 0) {
	invincible_timer--;
}

/// =========================
/// KNOCKBACK
/// =========================
if (abs(knockback_x) > 0.1 || abs(knockback_y) > 0.1) {
	impulse_x += knockback_x * 0.20;
	impulse_y += knockback_y * 0.20;

	knockback_x *= 0.8;
	knockback_y *= 0.8;
}

/// =========================
/// FLASH / BLINK
/// =========================
if (teleport_timer > 0) {
	if (teleport_timer % 4 == 0) {
		flash_visible = !flash_visible;
	}
} else if (flash_timer > 0) {
	show_debug_message(
		"flash_timer=" + string(flash_timer) + " flash_visible=" + string(flash_visible)
	);
	flash_timer--;

	// toggle visibility
	if (flash_timer % flash_interval == 0) {
		flash_visible = !flash_visible;
	}
} else {
	flash_visible = true;
}

/// =========================
/// TRAP
/// =========================
var tile = Tile_Get(x, y);
if (tile == TILE.TRAP) {
	if (trap_timer <= 0) {
		Damage_Apply(id, 10, id);
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
face = round(aim_dir / 90);
if (face == 4) {
	face = 0;
}

// Stop animating
if (input_x == 0 && input_y == 0) {
	image_index = 0;
}

// Set player sprite - use mask of sprite 3
mask_index = sprite[3];
sprite_index = sprite[face];

/// =========================
/// COMBAT TIMERS
/// =========================
if (active_weapon_cooldown > 0) {
	active_weapon_cooldown--;
}

/// =========================
/// WEAPON SWITCH
/// =========================
if (input_switch_weapon) {
	weapon_count = ds_list_size(weapons);
	if (weapon_count > 0) {
		active_weapon_index = (active_weapon_index + 1) % weapon_count;
		active_weapon = weapons[| active_weapon_index];
	}
}

/// =========================
/// ITEM SWITCH
/// =========================
if (input_switch_item) {
	var keys = ds_map_keys_to_array(inventory);
	var stack_count = array_length(keys);

	if (stack_count > 0) {
		// -------------------------------------------------
		// Find current stack index
		// -------------------------------------------------
		var current_index = 0;

		for (var i = 0; i < stack_count; i++) {
			if (keys[i] == active_item_name) {
				current_index = i;
				break;
			}
		}

		// -------------------------------------------------
		// Advance to next stack
		// -------------------------------------------------
		var next_index = (current_index + 1) % stack_count;
		var next_key = keys[next_index];
		var stack = inventory[? next_key];

		// -------------------------------------------------
		// Update active item
		// -------------------------------------------------
		active_item_name = next_key;
		active_item = stack[| 0];
	}
}
