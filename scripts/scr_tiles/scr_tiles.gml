// =============================================================================
// SCRIPT:      scr_tiles
// TYPE:        Tilemap / Terrain Subsystem
// =============================================================================

/// @description Centralized tilemap and terrain handling system.
///
/// Responsibilities:
/// - Tile lookup helpers
/// - Terrain type detection
/// - Terrain interaction queries
/// - Collision tile checks
/// - Tile property utilities
/// - Movement terrain validation
/// - Shared tilemap helper functions
///
/// Public API:
/// - Tile_Get()
/// - Tile_Is_Blocking()
///
/// Notes:
/// - Terrain behavior should remain centralized
/// - Shared movement systems depend on terrain queries
/// - Avoid duplicating tile logic across gameplay objects
/// - Supports player, animal, enemy, and item systems
/// - Tilemap references should be initialized by obj_controller

enum TILE {
    EMPTY,                 // 0
    WALL,                  // 1
    WATER,                 // 2
	MUD,                   // 3
    TRAP,                  // 4
    HOLE,                  // 5
	CHICKEN_COOP,          // 6
	COW_PASTURE,           // 7
	PIG_PEN,               // 8
	SHEEP_PASTURE,         // 9
	EXPANSION1,            // 10
	EXPANSION2,            // 11
	EXPANSION3             // 12
}

function Tile_Get(_x, _y) {

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

function Tile_Is_Blocking(_tile) {
    return (_tile == TILE.WALL || _tile == TILE.WATER);
}

function Tile_Is_Blocking_Thrown_Item(_tile) {
    return (_tile == TILE.WALL);
}