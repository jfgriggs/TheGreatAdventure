// =============================================================================
// OBJECT:      obj_projectile_magic
// EVENT:       Create
// SYSTEM:      Magic Projectile Initialization
// =============================================================================

event_inherited();


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