function fire_single(o, dir) {
    var p = instance_create_layer(o.x, o.y, "Instances", obj_projectile);
    p.direction = dir;
    p.speed = o.weapon.projectile_speed;
    p.damage = o.weapon.damage;
}

function fire_spread(o, dir) {
    for (var i = 0; i < o.weapon.pellets; i++) {
        var angle = dir + random_range(-o.weapon.spread, o.weapon.spread);
        var p = instance_create_layer(o.x, o.y, "Instances", obj_projectile);
        p.direction = angle;
        p.speed = o.weapon.projectile_speed;
        p.damage = o.weapon.damage;
    }
}

function fire_boomerang(o, dir) {
    var p = instance_create_layer(o.x, o.y, "Instances", obj_boomerang);
    p.direction = dir;
    p.speed = o.weapon.projectile_speed;
    p.owner = o;
}

function fire_trap(o, dir) {
    instance_create_layer(o.x, o.y, "Instances", obj_trap);
}

function fire_charge(o, dir) {
    var p = instance_create_layer(o.x, o.y, "Instances", obj_projectile);
    p.direction = dir;
    p.speed = o.weapon.projectile_speed;
    p.damage = o.weapon.damage * 2;
}