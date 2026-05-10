// =============================================================================
// OBJECT:      obj_player
// EVENT:       Create
// SYSTEM:      Player Initialization
// =============================================================================

/// @description Initializes player systems, runtime variables, movement configuration, combat systems, inventory data, and player state machine.
///
/// Responsibilities:
/// - Initialize movement variables
/// - Setup combat configuration
/// - Initialize inventory systems
/// - Configure terrain interaction
/// - Create player state machine
/// - Setup aiming/rotation variables
/// - Configure runtime flags
///
/// Notes:
/// - Player behavior is driven through state machine logic
/// - Movement should route through scr_movement
/// - State logic belongs in scr_player_states
/// - Combat systems should remain modularized

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

ds_list_add(weapons, Weapon_Create(WEAPON.SLINGSHOT));
ds_list_add(weapons, Weapon_Create(WEAPON.SHOTGUN));
ds_list_add(weapons, Weapon_Create(WEAPON.BOOMERANG));
ds_list_add(weapons, Weapon_Create(WEAPON.TRAP));
ds_list_add(weapons, Weapon_Create(WEAPON.BOW));
ds_list_add(weapons, Weapon_Create(WEAPON.MAGIC_STAFF));


active_weapon_index = 0;
active_weapon = weapons[| active_weapon_index];
active_weapon_cooldown = 0;

/// =========================
/// PROJECTILE SPAWN
/// =========================
projectile_spawn_forward = 0;
projectile_spawn_height = -16;

get_projectile_spawn_x = function(_dir = image_angle) {
    return x + lengthdir_x(projectile_spawn_forward, _dir);
};

get_projectile_spawn_y = function(_dir = image_angle) {
    return y + projectile_spawn_height + lengthdir_y(projectile_spawn_forward,_dir);
};


/// =========================
/// INVENTORY
/// =========================
inventory = ds_map_create();
inventory_max_items = 20;

active_item_name = "";
active_item = undefined;


// Pre-populated inventory items
Inventory_Add_Item(self, Item_Create(ITEM.CARROT));
Inventory_Add_Item(self, Item_Create(ITEM.CORN));

//active_item_index = 0;
//active_item = inventory[| active_item_index];


// ============================================================================
// Movement Handler
// ============================================================================

apply_movement = function(_vx, _vy) {

    // ------------------------------------------------------------------------
    // Horizontal Movement
    // ------------------------------------------------------------------------
    if (_vx != 0) {
        var new_x = x + _vx;
        var tile = Tile_Get(new_x, y);

        if (!Tile_Is_Blocking(tile)) {
            x = new_x;
        } else {
			// If inside a tile move out of it
			var step = sign(_vx);
            while (!Tile_Is_Blocking(Tile_Get(x + step, y))) {
                x += step;
            }
        }
    }


    // ------------------------------------------------------------------------
    // Vertical Movement
    // ------------------------------------------------------------------------

    if (_vy != 0) {
        var new_y = y + _vy;
        var tile = Tile_Get(x, new_y);

        if (!Tile_Is_Blocking(tile)) {
            y = new_y;
        } else {
			// If inside a tile move out of it
            var step = sign(_vy);
            while (!Tile_Is_Blocking(Tile_Get(x, y + step))) {
                y += step;
            }
        }
    }
};


// ============================================================================
// State Machine
// ============================================================================

sm = new StateMachine(id);
sm.change(Player_Idle(sm));
