# `objects/obj_projectile/Create_0.gml`

## What it does
Initializes shared projectile fields such as speed, direction, damage, range, origin, owner, and lifetime.

## When it runs
When a fired projectile is created.

## Important responsibilities
Prepares the common flight and combat data used by projectile children.

## Inputs and outputs
Writes projectile runtime fields including `speed`, `direction`, `damage`, `max_distance`, and starting coordinates.

## Relationships
Parent of arrow, magic, boomerang, pellets, and slug projectiles; depends on tile and damage systems.

## Learning concepts
A projectile is an object with its own flight state. A parent provides common setup for several projectile types.

## Known notes
Child projectiles may use different flight formulas or target checks.
