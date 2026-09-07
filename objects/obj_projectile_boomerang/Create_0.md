# `objects/obj_projectile_boomerang/Create_0.gml`

## What it does
Initializes boomerang damage, owner, elliptical flight geometry, timing, spin, and return tracking after inherited setup.

## When it runs
When a boomerang is thrown or fired.

## Important responsibilities
Stores the two focus points and ellipse values needed for outbound and return motion.

## Inputs and outputs
Reads the player owner and writes `damage`, `owner`, `flight_speed`, `ellipse_*`, focus, timer, and spin fields.

## Relationships
Child of `obj_projectile`; its owner is unlocked by Destroy cleanup.

## Learning concepts
A path can be described with geometry instead of a straight line. The owner reference connects projectile and player.

## Known notes
The source initializes its path lazily in Step after creation.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
