# `objects/obj_controller/Create_0.gml`

## What it does
Initializes the controller, global game values, tilemap access, effects, camera, audio, and starting world instances.

## When it runs
When the controller is created during startup.

## Important responsibilities
It owns high-level initialization and shared resources used by gameplay.

## Inputs and outputs
It reads room resources and writes controller fields such as tilemap and effect references, plus controller-owned globals.

## Relationships
Central dependency for tiles, game state, camera, HUD, and spawning. It uses `scr_globals` and other shared scripts.

## Learning concepts
Ownership means one system is responsible for creating and cleaning up a resource. Startup order controls what later objects may safely use.

## Known notes
`global.controller` is the expected route to controller-owned tilemap and effects.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
