# `objects/obj_projectile_magic/Create_0.gml`

## What it does
Configures a magic projectile's inherited fields and magic-specific speed, damage, direction, range, and origin.

## When it runs
When a magic projectile is created by a weapon.

## Important responsibilities
Supplies magic projectile combat tuning.

## Inputs and outputs
Writes speed, direction, damage, range, and starting position fields.

## Relationships
Child of `obj_projectile`; selected by magic weapon data and uses tile and damage helpers.

## Learning concepts
Projectile data controls how a shared object behaves.

## Known notes
Configuration extends inherited projectile setup.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
