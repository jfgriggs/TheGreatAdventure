// ===========================================================================
// OBJECT:       obj_projectile_magic
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Projectile Magic Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures a magic projectile's inherited fields and magic-specific speed, damage, direction, range, and origin.
//
// ===========================================================================

event_inherited();

damage = 5;

/// =========================
/// MAGIC MOTION
/// =========================

// Original travel direction
travel_dir = 0;

// Wave timer
wave_time = random(360);

// Wave movement speed
wave_frequency = 0.70;

// Side-to-side width
wave_amplitude = 3;

// =========================
// POSITION TRACKING
// =========================

// Starting point
base_x = x;
base_y = y;

max_distance = 50;

// Forward distance traveled
distance_traveled = 0;

// Random initial rotation
image_angle = random(360);

// Random spin direction/speed
image_angle_speed = random_range(-12, 12);

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
