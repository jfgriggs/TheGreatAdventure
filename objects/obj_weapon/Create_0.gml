// =============================================================================
// OBJECT:      obj_weapon
// EVENT:       Create
// SYSTEM:      weapon Initialization
// =============================================================================

/// @description Initializes weapon instance data, runtime variables, interaction behavior, and weapon configuration.
///
/// Responsibilities:
/// - Initialize weapon data structs
/// - Configure pickup behavior
/// - Setup collision/interactions
/// - Configure physics/movement variables
/// - Initialize visual state
/// - Setup runtime ownership/reference data
///
/// Notes:
/// - weapon definitions should remain data-driven
/// - Shared weapon behavior belongs in scr_weapons
/// - Avoid hardcoding weapon-specific logic directly here

/// =========================
/// weapon SETUP
/// =========================

// What type of weapon this is
weapon_type = undefined;

// =========================
// BOB ANIMATION (POLISH)
// =========================
base_y = y;

bob_amplitude = 1;
bob_speed = 0.1;
bob_phase = random(1000);


// =========================
// PICKUP SETTINGS
// =========================
pickup_radius = 16;

//// ============================================================================
//// Movement Handler
//// ============================================================================
//apply_movement = function(_vx, _vy) {

//    // ------------------------------------------------------------------------
//    // Horizontal Movement
//    // ------------------------------------------------------------------------
//    if (_vx != 0) {
//        var new_x = x + _vx;
//        var tile = Tile_Get(new_x, y);

//        if (!Tile_Is_Blocking_Fired_Weapon(tile)) {
//            x = new_x;
//        } else {
//			// If inside a tile move out of it
//			var step = sign(_vx);
//            while (!Tile_Is_Blocking_Fired_Weapon(Tile_Get(x + step, y))) {
//                x += step;
//            }
//        }
//    }


//    // ------------------------------------------------------------------------
//    // Vertical Movement
//    // ------------------------------------------------------------------------
//    if (_vy != 0) {
//        var new_y = y + _vy;
//        var tile = Tile_Get(x, new_y);

//        if (!Tile_Is_Blocking_Fired_Weapon(tile)) {
//            y = new_y;
//        } else {
//			// If inside a tile move out of it
//            var step = sign(_vy);
//            while (!Tile_Is_Blocking_Fired_Weapon(Tile_Get(x, y + step))) {
//                y += step;
//            }
//        }
//    }
//};