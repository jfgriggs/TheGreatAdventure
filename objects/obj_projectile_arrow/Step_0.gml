// File: obj_projectile_arrow.gml
// Event: step

vx = lengthdir_x(speed, direction);
vy = lengthdir_y(speed, direction);

var nx = x + vx;
var ny = y + vy;

// Wall collision
if (Tile_Is_Blocking_Fired_Weapon(Tile_Get(nx, ny))) {
    instance_destroy();
    exit;
}

x = nx;
y = ny;

// Hit enemies
with (obj_enemy_archer) {
    if (point_distance(x,y,other.x,other.y) < 10) {
        Damage_Apply(id, other.damage, other);
        instance_destroy(other);
    }
}

with (obj_enemy_predator) {
    if (point_distance(x,y,other.x,other.y) < 10) {
        Damage_Apply(id, other.damage, other);
        instance_destroy(other);
    }
}

// Distance traveled
var dist = point_distance(start_x, start_y, x, y);
var remaining = max_distance - dist;
if (remaining <= 0) {
	instance_destroy();
}
