# `objects/obj_projectile_boomerang/Step_0.gml`

## What it does
Calculates elliptical boomerang flight, limits its path, checks wall collision, and destroys it after return or timeout.

## When it runs
Once per frame while gameplay is active.

## Important responsibilities
Builds the path on first update, advances time and position, spins the sprite, checks the owner, and handles return conditions.

## Inputs and outputs
Reads ellipse geometry, owner position, flight timing, and tilemap; mutates position, image angle, and lifetime.

## Relationships
Child of `obj_projectile`; relies on owner and `scr_tiles`.

## Learning concepts
Lazy initialization means waiting until the first update to calculate data. A timeout is a maximum lifetime safeguard.

## Known notes
The boomerang's movement is intentionally different from straight projectiles.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
