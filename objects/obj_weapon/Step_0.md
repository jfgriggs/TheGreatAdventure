# `objects/obj_weapon/Step_0.gml`

## What it does
Updates shared weapon cooldown and firing behavior based on its owner and selected weapon definition.

## When it runs
Once per frame for a weapon instance during gameplay.

## Important responsibilities
Tracks timing and handles the common path from an attack request to projectile or effect creation.

## Inputs and outputs
Reads weapon data, owner input or aim, cooldown fields, and global play state; mutates timers and may create projectile instances.

## Relationships
Runtime parent event for concrete weapon children; uses `scr_weapons`, player state, and projectile objects.

## Learning concepts
A cooldown is a timer that prevents an action from happening every frame. The weapon owns firing timing while projectiles own flight.

## Known notes
Different weapon types vary through definition data and projectile object selection.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
