# `scripts/scr_tiles/scr_tiles.gml`

## What it does
Defines tile types and converts the controller's tilemap into terrain, blocking, safety, and habitat queries.

## When it runs
Movement, thrown items, projectiles, animals, and traps call these functions during gameplay.

## Important responsibilities
`Tile_Get` translates map indexes; the other functions decide whether players, animals, thrown items, or fired weapons may cross a tile.

## Inputs and outputs
`Tile_Get(_x, _y)` returns a `TILE` value. Predicate functions receive a tile and return true or false.

## Relationships
It depends on `global.controller.tilemap`. Movement and combat objects use it as a shared dependency.

## Learning concepts
A predicate answers a yes/no question. A tilemap is a grid of map cells that can be queried at a position.

## Known notes
If the controller does not exist, `Tile_Get` returns `TILE.EMPTY`; water blocks normal movement but only walls block thrown items and fired weapons.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
