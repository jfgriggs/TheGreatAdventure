// =============================================================================
// OBJECT:       obj_animal
// EVENT:        Create
// REVISION:     1.2.0
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
// Configuration
// -----------------------------------------------------------------------------

// Load immutable species configuration
var cfg = Animal_Get_Definition(animal_type);

/// Gameplay
point_value = cfg.point_value;

/// Movement
move_speed = cfg.move_speed;
wander_speed = cfg.wander_speed;
wander_move_time_min = cfg.wander_move_time_min;
wander_move_time_max = cfg.wander_move_time_max;
wander_idle_time_min = cfg.wander_idle_time_min;
wander_idle_time_max = cfg.wander_idle_time_max;

/// Habitat
tile_check_safe = cfg.tile_check_safe;
tile_check_blocking = cfg.tile_check_blocking;
stay_in_safe_area = cfg.stay_in_safe_area;

/// AI
vision_range = cfg.vision_range;
lose_range = cfg.lose_range;
lose_time_max = cfg.lose_time_max;
food_preferences = cfg.food_preferences;

// -----------------------------------------------------------------------------
// Sprite Configuration
// -----------------------------------------------------------------------------

sprite_set = cfg.sprite_set;
sprite_large = cfg.sprite_large;


// -----------------------------------------------------------------------------
// Health & Damage
// -----------------------------------------------------------------------------

max_hp = 100;
hp = max_hp;

is_dead = false;
is_safe = false;


// -----------------------------------------------------------------------------
// Movement Configuration
// -----------------------------------------------------------------------------

move_input_x = 0;
move_input_y = 0;

velocity_x = 0;
velocity_y = 0;

impulse_x = 0;
impulse_y = 0;

max_speed  = move_speed;

acceleration = 0.15;
movement_damping = 0.18;


// -----------------------------------------------------------------------------
// Visual Effects
// -----------------------------------------------------------------------------

flash_timer = 0;
flash_time  = 6;


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
// Runtime State
// -----------------------------------------------------------------------------

target = noone;
face = FACE.DOWN;


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