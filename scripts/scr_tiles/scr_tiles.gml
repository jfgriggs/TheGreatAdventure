// =============================================================================
// SCRIPT:       scr_tiles
// REVISION:     1.1.0
// SYSTEM:       Tile System
// ARCHITECTURE: Shared Tile Query Subsystem
//
// DESCRIPTION:
// Centralized tilemap and terrain handling for The Great Adventure.
//
// Responsibilities:
// - Tile lookup
// - Terrain classification
// - Collision queries
// - Safety queries
// - Animal habitat queries
//
// =============================================================================

// -----------------------------------------------------------------------------
// Revision History
// -----------------------------------------------------------------------------
//
// 1.1.0
// • Updated to project documentation standards.
// • Added function documentation.
// • Organized into logical sections.
// • Replaced instance lookup with global.controller.
//
// 1.0.0
// • Initial implementation.
//

// -----------------------------------------------------------------------------
// Tile Enumeration
// -----------------------------------------------------------------------------

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
/// @description
/// Returns the logical terrain type at the specified room position.
///
/// @param {Real} _x
///     Room X coordinate.
///
/// @param {Real} _y
///     Room Y coordinate.
///
/// @returns {TILE}
///     The terrain type at the specified location.
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
/// @description
/// Determines whether a player may safely occupy the specified terrain.
///
/// @param {TILE} _tile
///     Terrain type to evaluate.
///
/// @returns {Boolean}
///     True if the player may safely stand on the tile.
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
/// @description
/// Determines whether a tile blocks normal movement.
///
/// @param {TILE} _tile
/// @returns {Boolean}
function Tile_Is_Blocking(_tile)
{
    return _tile == TILE.WALL
        || _tile == TILE.WATER;
}

/// @function Tile_Is_Blocking_Thrown_Item
/// @description
/// Determines whether a thrown item is blocked by the terrain.
///
/// @param {TILE} _tile
/// @returns {Boolean}
function Tile_Is_Blocking_Thrown_Item(_tile)
{
    return _tile == TILE.WALL;
}

/// @function Tile_Is_Blocking_Fired_Weapon
/// @description
/// Determines whether a projectile is blocked by the terrain.
///
/// @param {TILE} _tile
/// @returns {Boolean}
function Tile_Is_Blocking_Fired_Weapon(_tile)
{
    return _tile == TILE.WALL;
}

/// @function Tile_Is_Blocking_Animal
/// @description
/// Determines whether an animal may move onto the specified terrain.
///
/// @param {TILE} _tile
/// @returns {Boolean}
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
/// @description
/// Returns whether the tile belongs to the chicken coop.
///
/// @param {TILE} _tile
/// @returns {Boolean}
function Tile_Is_Animal_Chicken_Coop(_tile)
{
    return _tile == TILE.CHICKEN_COOP;
}

/// @function Tile_Is_Animal_Cow_Pasture
/// @description
/// Returns whether the tile belongs to the cow pasture.
///
/// @param {TILE} _tile
/// @returns {Boolean}
function Tile_Is_Animal_Cow_Pasture(_tile)
{
    return _tile == TILE.COW_PASTURE;
}

/// @function Tile_Is_Animal_Pig_Pen
/// @description
/// Returns whether the tile belongs to the pig pen.
///
/// @param {TILE} _tile
/// @returns {Boolean}
function Tile_Is_Animal_Pig_Pen(_tile)
{
    return _tile == TILE.PIG_PEN;
}

/// @function Tile_Is_Animal_Sheep_Pasture
/// @description
/// Returns whether the tile belongs to the sheep pasture.
///
/// @param {TILE} _tile
/// @returns {Boolean}
function Tile_Is_Animal_Sheep_Pasture(_tile)
{
    return _tile == TILE.SHEEP_PASTURE;
}