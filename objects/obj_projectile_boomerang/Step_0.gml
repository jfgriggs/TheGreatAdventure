// =============================================================================
// OBJECT:      obj_projectile_boomerang
// EVENT:       Step
// SYSTEM:      Boomerang Runtime
// =============================================================================

/// =========================
/// INITIALIZE ELLIPSE
/// =========================
if (!initialized) {
    // -------------------------------------------------------------
    // PLAYER POSITION
    // -------------------------------------------------------------
    focus1_x = x;
    focus1_y = y;

    // -------------------------------------------------------------
    // TARGET POSITION
    // -------------------------------------------------------------
    var max_dist = 180;
    var dist = point_distance(focus1_x, focus1_y, target_x, target_y);
    var dir = point_direction(focus1_x, focus1_y, target_x, target_y);

    if (dist > max_dist) {
        dist = max_dist;
    }

    focus2_x = focus1_x + lengthdir_x(dist, dir);
    focus2_y = focus1_y + lengthdir_y(dist, dir);

    // -------------------------------------------------------------
    // CENTER
    // -------------------------------------------------------------
    center_x = (focus1_x + focus2_x) * 0.5;
    center_y = (focus1_y + focus2_y) * 0.5;

    // -------------------------------------------------------------
    // ROTATION
    // -------------------------------------------------------------
    ellipse_rotation = dir;

    // -------------------------------------------------------------
    // FOCUS DISTANCE
    // -------------------------------------------------------------
    ellipse_c = dist * 0.5;

    // -------------------------------------------------------------
    // MAJOR AXIS
    // -------------------------------------------------------------
    ellipse_a = sqrt(sqr(ellipse_c) + sqr(ellipse_b));

    initialized = true;
}


/// =========================
/// ADVANCE FLIGHT
/// =========================
t += flight_speed;

if (t >= 540) {
    instance_destroy();
    exit;
}


/// =========================
/// LOCAL ELLIPSE POSITION
/// =========================
var local_x = ellipse_a * dcos(t);
var local_y = ellipse_b * dsin(t);


/// =========================
/// ROTATE INTO WORLD SPACE
/// =========================
var local_dist = point_distance(0, 0, local_x, local_y);
var local_dir = point_direction(0, 0, local_x, local_y);

var rotated_x = lengthdir_x(local_dist, local_dir + ellipse_rotation);
var rotated_y = lengthdir_y(local_dist, local_dir + ellipse_rotation);


/// =========================
/// FINAL POSITION
/// =========================
var next_x = center_x + rotated_x;
var next_y = center_y + rotated_y;


/// =========================
/// WALL COLLISION
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
/// SPINNING
/// =========================
image_angle += spin_speed;


/// =========================
/// RETURN CATCH
/// =========================
if (instance_exists(owner)) {
    if (point_distance(x, y, focus1_x, focus1_y) < 8 && t > 360) {
        instance_destroy();
        exit;
    }
}