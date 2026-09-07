# `objects/obj_projectile_pellets/Create_0.gml`

## What it does
Initializes a pellet projectile with speed, direction, damage, maximum distance, and origin.

## When it runs
When a shotgun pellet is created.

## Important responsibilities
Supplies the pellet's shared projectile data.

## Inputs and outputs
Writes `speed`, `direction`, `damage`, `max_distance`, and starting coordinates.

## Relationships
Child of `obj_projectile`; selected by shotgun weapon behavior.

## Learning concepts
A weapon can create many small projectile instances, each with independent state.

## Known notes
The Create setup is similar to the slug but belongs to the pellet object.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
