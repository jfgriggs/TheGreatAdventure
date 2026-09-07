# `scripts/scr_enemy_archer_states/scr_enemy_archer_states.gml`

## What it does
Defines archer patrol, chase, and shoot states. The shoot state periodically creates and aims an arrow projectile.

## When it runs
The archer's state machine calls one state's callback every gameplay Step.

## Important responsibilities
It checks player distance against vision and attack ranges, controls movement intent, and uses `fire_rate` to time shots.

## Inputs and outputs
State constructors receive a state machine and return structs with callbacks. The callbacks read the owner archer and player and may create `projectile_object` instances.

## Relationships
`obj_enemy_archer` initializes the fields and projectile dependency consumed here. The shared state machine owns callback timing.

## Learning concepts
A timer can be used as a repeating counter. An object reference lets one object create or affect another.

## Known notes
The state script assumes the archer has a valid player and projectile setup from its Create event.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
