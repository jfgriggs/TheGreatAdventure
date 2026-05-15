// =============================================================================
// OBJECT:      obj_animal
// EVENT:       Create
// SYSTEM:      Animal Base Initialization
// =============================================================================

/// @description Initializes shared animal systems, runtime variables, AI configuration, movement settings, and state machine behavior for all animal child objects.
///
/// Child Objects:
/// - obj_animal_chicken
/// - obj_animal_cow
/// - obj_animal_sheep
/// - obj_animal_*
///
/// Responsibilities:
/// - Initialize shared animal variables
/// - Configure movement settings
/// - Setup AI behavior variables
/// - Initialize animal state machine
///
/// Notes:
/// - Child objects assign animal_type
/// - Species-specific configuration belongs in child objects
/// - Shared AI logic belongs in scr_animal_states
/// - Avoid species-specific logic in parent object


/// =========================
/// IDENTITY
/// =========================

animal_type = -1;

/// =========================
/// HEALTH
/// =========================

hp = 100;
max_hp = 100;

/// =========================
/// MOVEMENT
/// =========================

vx = 0;
vy = 0;

move_speed = 0.2;

/// =========================
/// VISUALS
/// =========================

face = 3;

sprite_set = [];
sprite_large = -1;

/// =========================
/// AI
/// =========================

vision_range = 180;
lose_range = 220;
lose_time_max = Seconds(4);

desired_items = [];

point_value = 50;

/// =========================
/// WANDER
/// =========================

wander_speed = move_speed;

wander_move_time_min = Seconds(3);
wander_move_time_max = Seconds(6);

wander_idle_time_min = Seconds(4);
wander_idle_time_max = Seconds(10);

/// =========================
/// RUNTIME
/// =========================

target = noone;
target_type = "";

is_safe = false;

/// =========================
/// STATE MACHINE
/// =========================

sm = new StateMachine(self);
sm.change(Animal_Idle(sm));


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
// Initial Visual Setup
// ============================================================================

if (array_length(sprite_set) > 0) {
    mask_index = sprite_set[3];
    sprite_index = sprite_set[3];
}