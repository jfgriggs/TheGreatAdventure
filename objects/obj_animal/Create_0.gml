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


/// =========================
/// ANIMAL DATA
/// =========================

animal = undefined;

// ==========================
// HEALTH
// ==========================
hp = 100;
max_hp = 100;

// ==========================
// SPRITE INDEX
// ==========================
face = 3

// ==========================
// MOVEMENT
// ==========================
vx = 0
vy = 0

/// =========================
/// RUNTIME
/// =========================

initialized = false;

/// =========================
/// STATE MACHINE
/// =========================

sm = undefined;


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
