// =============================================================================
// OBJECT:       obj_animal
// EVENT:        Create
// SYSTEM:       Animal Base Initialization
// ARCHITECTURE: Animal System
//
// DESCRIPTION:
// Initializes the common variables and systems shared by all animal types.
//
// Child animal objects configure species-specific values after calling
// event_inherited().
//
// This object provides the default movement interface required by the shared
// movement subsystem (scr_movement).
// =============================================================================


// -----------------------------------------------------------------------------
// Identity
// -----------------------------------------------------------------------------

animal_type = -1;


// -----------------------------------------------------------------------------
// Health & Damage
// -----------------------------------------------------------------------------

max_hp = 100;
hp = max_hp;

dead = false;


// -----------------------------------------------------------------------------
// Movement Interface
// -----------------------------------------------------------------------------
//
// Standard interface expected by the shared movement subsystem.
// Child objects override these defaults as needed.
//

tile_check_blocking = Tile_Is_Blocking_Animal;
tile_check_safe     = undefined;

stay_in_safe_area = false;
is_safe           = false;


// -----------------------------------------------------------------------------
// Movement Configuration
// -----------------------------------------------------------------------------

move_input_x = 0;
move_input_y = 0;

velocity_x = 0;
velocity_y = 0;

impulse_x = 0;
impulse_y = 0;

move_speed = 0.2;
max_speed  = move_speed;

acceleration = 0.15;
friction    = 0.18;


// -----------------------------------------------------------------------------
// Visual Effects
// -----------------------------------------------------------------------------

flash_timer = 0;
flash_time  = 6;


// -----------------------------------------------------------------------------
// Wander Behavior
// -----------------------------------------------------------------------------

wander_speed = move_speed;

wander_move_time_min = Seconds(3);
wander_move_time_max = Seconds(6);

wander_idle_time_min = Seconds(4);
wander_idle_time_max = Seconds(10);


// -----------------------------------------------------------------------------
// Aggro / Flee
// -----------------------------------------------------------------------------

is_aggressive = false;

flee_source = noone;

flee_timer = 0;
flee_time = Seconds(3);

flee_speed = wander_speed * 15;
flee_speed_current = 0;
flee_slowdown = 0.08;


// -----------------------------------------------------------------------------
// Visual Configuration
// -----------------------------------------------------------------------------

face = 3;

sprite_set = [];
sprite_large = -1;


// -----------------------------------------------------------------------------
// AI Configuration
// -----------------------------------------------------------------------------

vision_range = 180;

lose_range = 220;
lose_time_max = Seconds(4);

desired_items = [];

point_value = 50;


// -----------------------------------------------------------------------------
// Runtime State
// -----------------------------------------------------------------------------

target = noone;
target_type = "";


// -----------------------------------------------------------------------------
// State Machine
// -----------------------------------------------------------------------------
//
// Controls all common animal behavior.
// Individual states are implemented in scr_animal_states.
//

sm = new StateMachine(self);
sm.change(Animal_Idle(sm));


// -----------------------------------------------------------------------------
// Initial Visual Setup
// -----------------------------------------------------------------------------

if (array_length(sprite_set) > 0)
{
	mask_index = sprite_set[3];
	sprite_index = sprite_set[3];
}