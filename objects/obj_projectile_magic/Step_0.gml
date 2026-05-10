// =============================================================================
// OBJECT:      obj_projectile_magic
// EVENT:       Step
// SYSTEM:      Magic Projectile Runtime
// =============================================================================

/// =========================
/// DISTANCE
/// =========================
distance_traveled += speed;

if (distance_traveled >= max_distance) {
    instance_destroy();
    exit;
}


/// =========================
/// WAVE TIMER
/// =========================
wave_time += wave_frequency;


/// =========================
/// FORWARD MOVEMENT
/// =========================
var forward_x = lengthdir_x(
    distance_traveled,
    travel_dir
);

var forward_y = lengthdir_y(
    distance_traveled,
    travel_dir
);


/// =========================
/// SINE OFFSET
/// =========================
var wave_offset =
    sin(wave_time)
    * wave_amplitude;


/// =========================
/// SIDEWAYS DIRECTION
/// =========================
var side_dir = travel_dir + 90;


/// =========================
/// SIDEWAYS OFFSET
/// =========================
var side_x = lengthdir_x(
    wave_offset,
    side_dir
);

var side_y = lengthdir_y(
    wave_offset,
    side_dir
);


/// =========================
/// FINAL POSITION
/// =========================
var next_x = base_x + forward_x + side_x;
var next_y = base_y + forward_y + side_y;


/// =========================
/// COLLISION
/// =========================
var tile = Tile_Get(next_x, next_y);

if (Tile_Is_Blocking_Fired_Weapon(tile)) {
    instance_destroy();
    exit;
}


// Apply movement
x = next_x;
y = next_y;


/// =========================
/// ROTATION
/// =========================
//image_angle += 8;
image_angle += image_angle_speed;