# `scripts/scr_damage/scr_damage.gml`

## What it does
Defines damage helpers that apply hit points, invincibility timing, knockback, and death behavior to damageable instances.

## When it runs
Weapons, projectiles, traps, and other combat objects call these functions when a hit is detected.

## Important responsibilities
It reduces health, prevents repeated hits during invincibility frames, records knockback, and handles the dead state according to the target's fields.

## Inputs and outputs
Damage functions receive a target and damage-related values. They mutate fields such as `hp`, `invincible_timer`, `knockback_x`, `knockback_y`, and death status.

## Relationships
Enemy and player objects provide the fields consumed here; projectile and trap events are callers. It is a shared script rather than an object parent.

## Learning concepts
Health is state stored on an instance. Knockback is an impulse that changes movement after a hit.

## Known notes
Targets must initialize the capabilities this script expects. The source also contains legacy defensive checks for missing instance fields.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
