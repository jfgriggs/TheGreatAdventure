// =============================================================================
// OBJECT:       obj_player
// EVENT:        Create
// SYSTEM:       Player Initialization
// ARCHITECTURE: Player System
//
// DESCRIPTION:
// Initializes the player's runtime variables, shared movement interface,
// combat systems, inventory, projectile helpers, and state machine.
//
// The player uses the shared movement subsystem (scr_movement) and therefore
// initializes the standard movement interface expected by that system.
// =============================================================================

// -----------------------------------------------------------------------------
// Sprite Configuration
// -----------------------------------------------------------------------------

face = FACE.DOWN;
sprite = array_create(4);

// -----------------------------------------------------------------------------
// Input
// -----------------------------------------------------------------------------

input_x = 0;
input_y = 0;
input_attack = false;
input_throw = false;

move_input_x = 0;
move_input_y = 0;

// -----------------------------------------------------------------------------
// Movement Interface
// -----------------------------------------------------------------------------
//
// Standard interface expected by the shared movement subsystem.
//
// Objects that participate in scr_movement initialize these values even if
// they do not use every feature.
//

tile_check_blocking = Tile_Is_Blocking;
tile_check_safe     = undefined;

stay_in_safe_area = false;
is_safe           = false;

// -----------------------------------------------------------------------------
// Movement Configuration
// -----------------------------------------------------------------------------

move_speed_default = 2;
move_speed = move_speed_default;

velocity_x = 0;
velocity_y = 0;

impulse_x = 0;
impulse_y = 0;

acceleration = 0.45;
movement_damping = 0.10;

max_speed = move_speed;

spawn_x = x;
spawn_y = y;

center_x_offset = 10;
center_y_offset = 10;

center_y = y - center_y_offset;   // Updated in Step event.

weapon_offset_dist = 1;
aim_dir = 0;

// -----------------------------------------------------------------------------
// Audio
// -----------------------------------------------------------------------------

game_over_sound_played = false;
music_fade = false;
hole_sound_played = false;

// -----------------------------------------------------------------------------
// Teleport
// -----------------------------------------------------------------------------

teleport_timer = 0;
teleport_phase = 0;
teleport_spark_delay = 0;

// -----------------------------------------------------------------------------
// Health & Damage
// -----------------------------------------------------------------------------

max_hp = 100;
hp = max_hp;

iframes = 20;
invincible_timer = 0;

knockback_x = 0;
knockback_y = 0;
knockback_force = 6;

is_dead = false;

hit_timer = 0;
throw_timer = 0;

// -----------------------------------------------------------------------------
// Visual Effects
// -----------------------------------------------------------------------------

flash_timer = 0;       // Remaining flash duration.
flash_interval = 6;    // Frames between visibility toggles.
flash_visible = true;

// -----------------------------------------------------------------------------
// Movement Lock
// -----------------------------------------------------------------------------

control_locked = false;

// -----------------------------------------------------------------------------
// Traps
// -----------------------------------------------------------------------------

trap_timer = 0;
trap_cooldown = 60;

// -----------------------------------------------------------------------------
// Weapons
// -----------------------------------------------------------------------------

weapons = ds_list_create();

// ds_list_add(weapons, Weapon_Create(WEAPON.SLINGSHOT));
// ds_list_add(weapons, Weapon_Create(WEAPON.SHOTGUN));
// ds_list_add(weapons, Weapon_Create(WEAPON.BOOMERANG));
// ds_list_add(weapons, Weapon_Create(WEAPON.TRAP));
// ds_list_add(weapons, Weapon_Create(WEAPON.BOW));
// ds_list_add(weapons, Weapon_Create(WEAPON.MAGIC_STAFF));

active_weapon_index = 0;
active_weapon = weapons[| active_weapon_index];
active_weapon_cooldown = 0;

// -----------------------------------------------------------------------------
// Projectile Configuration
// -----------------------------------------------------------------------------

projectile_spawn_forward = 0;
projectile_spawn_height = -16;

/// @function get_projectile_spawn_x
/// @description
/// Returns the X coordinate where projectiles should be created.
///
/// @param {_dir} Direction in degrees.
/// @return {Real}
get_projectile_spawn_x = function(_dir = image_angle) {
	return x + lengthdir_x(projectile_spawn_forward, _dir);
};

/// @function get_projectile_spawn_y
/// @description
/// Returns the Y coordinate where projectiles should be created.
///
/// @param {_dir} Direction in degrees.
/// @return {Real}
get_projectile_spawn_y = function(_dir = image_angle) {
	return y + projectile_spawn_height + lengthdir_y(projectile_spawn_forward, _dir);
};

// -----------------------------------------------------------------------------
// Inventory
// -----------------------------------------------------------------------------

inventory = ds_map_create();
inventory_max_items = 20;

active_item_name = "";
active_item = undefined;

// Starting inventory.
Inventory_Add_Item(self, Item_Create(ITEM.CARROT));
Inventory_Add_Item(self, Item_Create(ITEM.CORN));

// -----------------------------------------------------------------------------
// Movement Functions
// -----------------------------------------------------------------------------
//
// Routes all player movement through the shared movement subsystem.
//

/// @function apply_movement
/// @description
/// Updates player movement using the shared movement subsystem.
apply_movement = function() {
	Movement_Update(self);
};

// -----------------------------------------------------------------------------
// State Machine
// -----------------------------------------------------------------------------
//
// Controls all player behavior.
// Individual player states are implemented in scr_player_states.
//

sm = new StateMachine(id);
sm.change(Player_Idle(sm));