# `objects/obj_projectile_pellets/Step_0.gml`

## What it does
Moves pellets, checks wall collision, tests enemy hits, and removes pellets after their range is used.

## When it runs
Once per frame during active gameplay.

## Important responsibilities
Updates each pellet independently and applies its damage to supported targets.

## Inputs and outputs
Reads movement and damage fields; mutates position, target health, and projectile lifetime.

## Relationships
Child of `obj_projectile`; used by shotgun firing and shared tile/damage rules.

## Learning concepts
Multiple instances can represent one action, such as a shotgun blast.

## Known notes
The target checks are explicit in the source rather than a general target registry.
