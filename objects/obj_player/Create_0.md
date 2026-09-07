# `objects/obj_player/Create_0.gml`

## What it does
Initializes the shared player: movement, health and damage fields, inventory, weapons, state machine, animation, and game-over tracking.

## When it runs
When a player instance is created.

## Important responsibilities
Sets the runtime fields used by player states, movement, combat, inventory, camera, and UI.

## Inputs and outputs
Reads global spawn and player configuration values; writes fields including position offsets, velocity, health, inventory, weapons, `sm`, and timers.

## Relationships
Parent of Ben and Leni. Depends on controller-owned globals, movement, damage, weapons, items, and player states.

## Learning concepts
A player object is an owner of several pieces of runtime state. A state machine chooses the current player behavior.

## Known notes
The child player Create events provide character identity or presentation while this parent handles shared setup.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
