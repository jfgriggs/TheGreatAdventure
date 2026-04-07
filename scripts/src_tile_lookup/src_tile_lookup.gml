function tile_get(_x, _y) {

    var ctrl = instance_find(obj_controller, 0);

    if (ctrl == noone) return TILE.EMPTY;

    var tilemap = ctrl.tilemap;

    var tile = tilemap_get_at_pixel(tilemap, _x, _y);
    var index = tile_get_index(tile);

    switch(index) {
        case 1: return TILE.WALL;
        case 2: return TILE.WATER;
        case 3: return TILE.MUD;
        case 4: return TILE.TRAP;
        case 5: return TILE.HOLE;
        case 6: return TILE.EXPANSION1;
        case 7: return TILE.EXPANSION2;
        case 8: return TILE.EXPANSION3;
    }

    return TILE.EMPTY;
}

function tile_is_blocking(_tile) {
    return (_tile == TILE.WALL || _tile == TILE.WATER);
}