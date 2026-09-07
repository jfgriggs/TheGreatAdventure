// ===========================================================================
// SCRIPT:       scr_tiles
// REVISION:     1.1.0
// SYSTEM:       Tiles System
// ARCHITECTURE: Shared Tiles System
//
// DESCRIPTION:
// Defines tile types and converts the controller's tilemap into terrain, blocking, safety, and habitat queries.
//
// ===========================================================================

enum TILE {
    EMPTY,              // 0
    WALL,               // 1
    WATER,              // 2
    MUD,                // 3
    TRAP,               // 4
    HOLE,               // 5
    CHICKEN_COOP,       // 6
    COW_PASTURE,        // 7
    PIG_PEN,            // 8
    SHEEP_PASTURE,      // 9
    EXPANSION1,         // 10
    EXPANSION2,         // 11
    EXPANSION3          // 12
}

// -----------------------------------------------------------------------------
// Tile Lookup
// -----------------------------------------------------------------------------

/// @function Tile_Get
/// @description Handles tile get for this file's subsystem.
/// @param {Any} _x Input used by Tile_Get.
/// @param {Any} _y Input used by Tile_Get.
/// @returns {Any} The result of the operation, when it produces one.
function Tile_Get(_x, _y)
{
    var ctrl = global.controller;

    if (!instance_exists(ctrl))
    {
        return TILE.EMPTY;
    }

    var tile = tilemap_get_at_pixel(ctrl.tilemap, _x, _y);
    var index = tile_get_index(tile);

    switch (index)
    {
        case 1:  return TILE.WALL;
        case 2:  return TILE.WATER;
        case 3:  return TILE.MUD;
        case 4:  return TILE.TRAP;
        case 5:  return TILE.HOLE;
        case 6:  return TILE.CHICKEN_COOP;
        case 7:  return TILE.COW_PASTURE;
        case 8:  return TILE.PIG_PEN;
        case 9:  return TILE.SHEEP_PASTURE;
        case 10: return TILE.EXPANSION1;
        case 11: return TILE.EXPANSION2;
        case 12: return TILE.EXPANSION3;
    }

    return TILE.EMPTY;
}

// -----------------------------------------------------------------------------
// Safety Queries
// -----------------------------------------------------------------------------

/// @function Tile_Is_Player_Safe
/// @description Handles tile is player safe for this file's subsystem.
/// @param {Any} _tile Input used by Tile_Is_Player_Safe.
/// @returns {Any} The result of the operation, when it produces one.
function Tile_Is_Player_Safe(_tile)
{
    if (Tile_Is_Blocking(_tile))
    {
        return false;
    }

    switch (_tile)
    {
        case TILE.HOLE:
        case TILE.WATER:
        case TILE.TRAP:
            return false;
    }

    return true;
}

// -----------------------------------------------------------------------------
// Collision Queries
// -----------------------------------------------------------------------------

/// @function Tile_Is_Blocking
/// @description Handles tile is blocking for this file's subsystem.
/// @param {Any} _tile Input used by Tile_Is_Blocking.
/// @returns {Any} The result of the operation, when it produces one.
function Tile_Is_Blocking(_tile)
{
    return _tile == TILE.WALL
        || _tile == TILE.WATER;
}

/// @function Tile_Is_Blocking_Thrown_Item
/// @description Handles tile is blocking thrown item for this file's subsystem.
/// @param {Any} _tile Input used by Tile_Is_Blocking_Thrown_Item.
/// @returns {Any} The result of the operation, when it produces one.
function Tile_Is_Blocking_Thrown_Item(_tile)
{
    return _tile == TILE.WALL;
}

/// @function Tile_Is_Blocking_Fired_Weapon
/// @description Handles tile is blocking fired weapon for this file's subsystem.
/// @param {Any} _tile Input used by Tile_Is_Blocking_Fired_Weapon.
/// @returns {Any} The result of the operation, when it produces one.
function Tile_Is_Blocking_Fired_Weapon(_tile)
{
    return _tile == TILE.WALL;
}

/// @function Tile_Is_Blocking_Animal
/// @description Handles tile is blocking animal for this file's subsystem.
/// @param {Any} _tile Input used by Tile_Is_Blocking_Animal.
/// @returns {Any} The result of the operation, when it produces one.
function Tile_Is_Blocking_Animal(_tile)
{
    return _tile == TILE.WALL
        || _tile == TILE.WATER
        || _tile == TILE.HOLE
        || _tile == TILE.TRAP;
}

// -----------------------------------------------------------------------------
// Animal Habitat Queries
// -----------------------------------------------------------------------------

/// @function Tile_Is_Animal_Chicken_Coop
/// @description Handles tile is animal chicken coop for this file's subsystem.
/// @param {Any} _tile Input used by Tile_Is_Animal_Chicken_Coop.
/// @returns {Any} The result of the operation, when it produces one.
function Tile_Is_Animal_Chicken_Coop(_tile)
{
    return _tile == TILE.CHICKEN_COOP;
}

/// @function Tile_Is_Animal_Cow_Pasture
/// @description Handles tile is animal cow pasture for this file's subsystem.
/// @param {Any} _tile Input used by Tile_Is_Animal_Cow_Pasture.
/// @returns {Any} The result of the operation, when it produces one.
function Tile_Is_Animal_Cow_Pasture(_tile)
{
    return _tile == TILE.COW_PASTURE;
}

/// @function Tile_Is_Animal_Pig_Pen
/// @description Handles tile is animal pig pen for this file's subsystem.
/// @param {Any} _tile Input used by Tile_Is_Animal_Pig_Pen.
/// @returns {Any} The result of the operation, when it produces one.
function Tile_Is_Animal_Pig_Pen(_tile)
{
    return _tile == TILE.PIG_PEN;
}

/// @function Tile_Is_Animal_Sheep_Pasture
/// @description Handles tile is animal sheep pasture for this file's subsystem.
/// @param {Any} _tile Input used by Tile_Is_Animal_Sheep_Pasture.
/// @returns {Any} The result of the operation, when it produces one.
function Tile_Is_Animal_Sheep_Pasture(_tile)
{
    return _tile == TILE.SHEEP_PASTURE;
}

// ---------------------------------------------------------------------------
// Revision History
// 1.1.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
