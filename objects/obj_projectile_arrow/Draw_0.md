# `objects/obj_projectile_arrow/Draw_0.gml`

## What it does
Draws the arrow with visual orientation matching its flight direction.

## When it runs
During the arrow's world Draw event.

## Important responsibilities
Presents the projectile without changing its flight or damage logic.

## Inputs and outputs
Reads position, sprite, and direction and draws the arrow.

## Relationships
Belongs to the arrow child of `obj_projectile`; direction is updated or assigned by firing code.

## Learning concepts
The same direction value can control both movement and visual rotation.

## Known notes
Rendering is separate from collision and hit behavior.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
