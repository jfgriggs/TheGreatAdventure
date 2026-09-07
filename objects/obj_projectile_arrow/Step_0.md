# `objects/obj_projectile_arrow/Step_0.gml`

## What it does
Moves the arrow, checks wall collision and travel distance, and handles its target hit behavior.

## When it runs
Once per frame while gameplay is active.

## Important responsibilities
Updates flight, tests fired-weapon tile blocking, and applies arrow damage or destruction rules.

## Inputs and outputs
Reads direction, speed, damage, owner, and origin; changes position and may destroy or damage instances.

## Relationships
Child runtime event of `obj_projectile`; archer states create this object.

## Learning concepts
A moving object repeatedly calculates its next position. Hit testing checks whether that path reaches a target.

## Known notes
Uses the shared tile-blocking rule for fired weapons.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
