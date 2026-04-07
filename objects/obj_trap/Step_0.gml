lifetime--;
if (lifetime <= 0) instance_destroy();

// Affect enemies
with (obj_enemy_archer) {
    if (point_distance(x,y,other.x,other.y) < other.radius) {
        speed *= 0.9;
    }
}

with (obj_enemy_predator) {
    if (point_distance(x,y,other.x,other.y) < other.radius) {
        speed *= 0.9;
    }
}