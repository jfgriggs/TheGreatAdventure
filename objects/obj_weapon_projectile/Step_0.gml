// File: obj_weapon_projectile.gml
// Event: step

var nx = x + lengthdir_x(speed, direction);
var ny = y + lengthdir_y(speed, direction);

// Wall collision
if (tile_is_blocking(tile_get(nx, ny))) {
    instance_destroy();
    exit;
}

x = nx;
y = ny;

// Hit enemies
with (obj_enemy_archer) {
    if (point_distance(x,y,other.x,other.y) < 10) {
        apply_damage(id, other.damage, other);
        instance_destroy(other);
    }
}

with (obj_enemy_predator) {
    if (point_distance(x,y,other.x,other.y) < 10) {
        apply_damage(id, other.damage, other);
        instance_destroy(other);
    }
}