// =============================================================================
// OBJECT:      obj_projectile_boomerang
// EVENT:       Create
// SYSTEM:      Boomerang Initialization
// =============================================================================

/// =========================
/// OWNER
/// =========================
owner = noone;

/// =========================
/// LOCK PLAYER MOVEMENT
/// =========================
if (instance_exists(obj_player)) {
    obj_player.movement_locked = true;
}

/// =========================
/// FLIGHT
/// =========================
t = 180;

// Degrees per frame
flight_speed = 5;


/// =========================
/// ELLIPSE
/// =========================

// Minor axis radius
ellipse_b = 20;


// =========================
// FOCI
// =========================
focus1_x = x;
focus1_y = y;

focus2_x = x;
focus2_y = y;


// =========================
// CENTER
// =========================
center_x = x;
center_y = y;


// =========================
// AXES
// =========================

// Semi-major axis
ellipse_a = 0;

// Distance from center to focus
ellipse_c = 0;


// =========================
// ROTATION
// =========================
ellipse_rotation = 0;


// =========================
// VISUALS
// =========================
spin_speed = 30;


/// =========================
/// INITIALIZATION
/// =========================
initialized = false;