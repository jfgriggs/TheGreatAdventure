# `objects/obj_projectile_boomerang/Draw_0.gml`

## What it does
Draws the boomerang during its special flight.

## When it runs
During the boomerang's world Draw event.

## Important responsibilities
Presents the projectile as its Step event changes path and spin values.

## Inputs and outputs
Reads sprite, position, scale, and image-angle fields and draws the boomerang.

## Relationships
Belongs to `obj_projectile_boomerang`; presentation follows its elliptical movement.

## Learning concepts
Draw code can use simulation values to make motion visible.

## Known notes
The Draw event does not own boomerang path calculations.
