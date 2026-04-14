// File: obj_player.gml
// Event: create

/// =========================
///  --- STATE MACHINE ---
/// =========================
sm = new StateMachine(id);
sm.change(Player_Idle(sm));


/// =========================
/// INITIALIZATION
/// =========================

// Sprite index (down right)
face = 3;

sprite[0] = sPlayerRightBoy;
sprite[1] = sPlayerUpBoy;
sprite[2] = sPlayerLeftBoy;
sprite[3] = sPlayerDownBoy;

	
/// =========================
/// SPRITE CONTROL
/// =========================
input_x = 0;
input_y = 0;
input_attack = false;
input_throw = false;

move_speed_default = 2;
move_speed = move_speed_default
move_dir = 0;

spawn_x = x;
spawn_y = y;

center_y_offset = 10;
center_y_offset = 10;
center_y = y - center_y_offset;   // Set in step event

weapon_offset_dist = 1;
aim_dir = 0;


/// =========================
/// SOUND CONTROL
/// =========================
game_over_sound_played = false;
music_fade = false;
hole_sound_played = false;


/// =========================
/// TELEPORT
/// =========================
teleport_timer = 0;
teleport_phase = 0;
teleport_done = false;
teleport_spark_delay = 0;


/// =========================
/// HEALTH / DAMAGE
/// =========================
hp = 100;

iframes = 20;
invincible_timer = 0;

knockback_x = 0;
knockback_y = 0;
knockback_force = 6;

is_dead = false;

hit_timer = 0;
throw_timer = 0;

/// =========================
/// FLASH
/// =========================
flash_timer = 0;           // total remaining duration
flash_interval = 6;        // frames per blink (~10 blinks/sec)
flash_visible = true;      // toggle state


/// =========================
/// TRAPS
/// =========================
trap_timer = 0;
trap_cooldown = 60; // frames (~2 sec)


/// =========================
/// WEAPONS
/// =========================
weapons = ds_list_create();

ds_list_add(weapons, Weapon_Create("bow"));
ds_list_add(weapons, Weapon_Create("spread"));

weapon_index = 0;
weapon = weapons[| weapon_index];

weapon_cooldown = 0;


/// =========================
/// INVENTORY
/// =========================
inventory = ds_list_create();

// Pre-populated inventory items
ds_list_add(inventory, Item_Create(ITEM.CARROT));
ds_list_add(inventory, Item_Create(ITEM.CORN));

active_item_index = 0;
active_item = inventory[| active_item_index];

move_and_collide_fn = function(_vx, _vy) {
    var o = self;

	//show_debug_message("(x,y)=" + string(o.x) + "," + string(o.y) + " (vx,vy)=" + string(_vx) + "," + string(_vy));

	// --- X ---
    if (_vx != 0) {
        var new_x = o.x + _vx;
        var tile = tile_get(new_x, o.y);

        if (!tile_is_blocking(tile)) {
            o.x = new_x;
        } else {
			// If inside a tile move out of it
			var step = sign(_vx);
            while (!tile_is_blocking(tile_get(o.x + step, o.y))) {
                o.x += step;
            }
        }
    }

    // --- Y ---
    if (_vy != 0) {
        var new_y = o.y + _vy;
        var tile = tile_get(o.x, new_y);

        if (!tile_is_blocking(tile)) {
            o.y = new_y;
        } else {
			// If inside a tile move out of it
            var step = sign(_vy);
            while (!tile_is_blocking(tile_get(o.x, o.y + step))) {
                o.y += step;
            }
        }
    }
};