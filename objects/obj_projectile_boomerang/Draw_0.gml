// =============================================================================
// OBJECT:      obj_projectile_boomerang
// EVENT:       Draw
// SYSTEM:      Boomerang Rendering
// =============================================================================

/// =========================
/// DEBUG ELLIPSE
/// =========================
draw_set_color(c_aqua);

var steps = 96;

var prev_x;
var prev_y;

for (var i = 0; i <= steps; i++) {

    var angle = (i / steps) * 360;

    // ---------------------------------------------------------
    // LOCAL POSITION
    // ---------------------------------------------------------

    var local_x = ellipse_a * dcos(angle);
    var local_y = ellipse_b * dsin(angle);

    // ---------------------------------------------------------
    // ROTATE - Rotate local ellipse into world space
    // ---------------------------------------------------------
	var local_dist = point_distance(0, 0, local_x, local_y);
	var local_dir = point_direction(0, 0, local_x, local_y);

	var rotated_x = lengthdir_x(local_dist, local_dir + ellipse_rotation);
	var rotated_y = lengthdir_y(local_dist, local_dir + ellipse_rotation);

    // ---------------------------------------------------------
    // WORLD POSITION
    // ---------------------------------------------------------
    var px = center_x + rotated_x;
    var py = center_y + rotated_y;

    // ---------------------------------------------------------
    // DRAW SEGMENT
    // ---------------------------------------------------------
    if (i > 0) {
        draw_line(prev_x, prev_y, px, py);
    }

    prev_x = px;
    prev_y = py;
}

// Draw foci
draw_set_color(c_red);

draw_circle(focus1_x, focus1_y, 3, false);
draw_circle(focus2_x, focus2_y, 3, false);


/// =========================
/// DRAW BOOMERANG
/// =========================
draw_self();