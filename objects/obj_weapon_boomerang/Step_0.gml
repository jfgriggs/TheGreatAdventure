// File: obj_weapon_bomerang.gml
// Event: step

var dist = point_distance(x,y,start_x,start_y);

if (!returning && dist > max_dist) {
    returning = true;
}

if (returning && instance_exists(owner)) {
    direction = point_direction(x,y,owner.x,owner.y);
}

move_and_collide(id,
    lengthdir_x(speed, direction),
    lengthdir_y(speed, direction)
);

if (returning && point_distance(x,y,owner.x,owner.y) < 10) {
    instance_destroy();
}