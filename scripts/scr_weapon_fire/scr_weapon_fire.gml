// File: scr_weapon_fire.gml

function weapon_fire(o) {

    var dir = point_direction(o.x, o.y, mouse_world_x(), mouse_world_y());

    switch(o.weapon.type) {

        case "single": fire_single(o, dir); break;
        case "spread": fire_spread(o, dir); break;
        case "boomerang": fire_boomerang(o, dir); break;
        case "trap": fire_trap(o, dir); break;
        case "charge": fire_charge(o, dir); break;
    }
}