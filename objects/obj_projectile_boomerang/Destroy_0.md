# `objects/obj_projectile_boomerang/Destroy_0.gml`

## What it does
Unlocks the owner player's controls when the boomerang is destroyed, if that owner still exists.

## When it runs
When the boomerang instance is destroyed.

## Important responsibilities
Restores the owner state so firing the boomerang cannot leave the player locked.

## Inputs and outputs
Reads `owner` and changes the owner's `control_locked` field; no return value.

## Relationships
Complements boomerang Create and Step; depends on the owner player instance.

## Learning concepts
Cleanup can also restore gameplay state, not only release memory.

## Known notes
The owner existence check protects against a player already being removed.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
