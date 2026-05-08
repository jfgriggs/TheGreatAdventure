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
/// - Configure terrain interaction
/// - Setup follow/target tracking
/// - Initialize wandering behavior
/// - Configure pen/safe tracking
///
/// Notes:
/// - Child objects assign animal_type
/// - Species-specific configuration belongs in child objects
/// - Shared AI logic belongs in scr_animal_states
/// - Shared movement logic belongs in scr_movement
/// - Animal data should remain data-driven
/// - Avoid species-specific logic in parent object
show_debug_message("Animal created: " + object_get_name(object_index));

/// =========================
///  --- STATE MACHINE ---
/// =========================
//sm = new StateMachine(id);
//sm.change(Animal_Idle(sm));

/// =========================
/// ANIMAL SETUP
/// =========================

// Sprite index (facing right)
face = 3;

animal = undefined // change per instance

// Runtime
//input_x = 0;
//input_y = 0;
target = noone;
target_type = "none";

lose_timer = 0;
eat_timer = 0;

wander_dir = irandom(359);
wander_timer = 0;

// Movement helper
apply_movement = function(_vx, _vy) {
    var o = self;

	//show_debug_message("(x,y)=" + string(o.x) + "," + string(o.y) + " (vx,vy)=" + string(_vx) + "," + string(_vy));

	// --- X ---
    if (_vx != 0) {
        var new_x = o.x + _vx;
        var tile = Tile_Get(new_x, o.y);

        if (!Tile_Is_Blocking(tile)) {
            o.x = new_x;
        } else {
			// If inside a tile move out of it
			var step = sign(_vx);
            while (!Tile_Is_Blocking(Tile_Get(o.x + step, o.y))) {
                o.x += step;
            }
        }
    }

    // --- Y ---
    if (_vy != 0) {
        var new_y = o.y + _vy;
        var tile = Tile_Get(o.x, new_y);

        if (!Tile_Is_Blocking(tile)) {
            o.y = new_y;
        } else {
			// If inside a tile move out of it
            var step = sign(_vy);
            while (!Tile_Is_Blocking(Tile_Get(o.x, o.y + step))) {
                o.y += step;
            }
        }
    }
};


// ============================================================================
// State Machine
// ============================================================================

sm = new StateMachine(id);
sm.change(Animal_Idle(sm));

