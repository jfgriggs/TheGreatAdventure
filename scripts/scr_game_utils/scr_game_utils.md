# `scripts/scr_game_utils/scr_game_utils.gml`

## What it does
Provides small reusable game helpers, including time conversion, random or selection utilities, and general value operations used by gameplay systems.

## When it runs
Any object or script that needs one of these utilities calls it during initialization or gameplay.

## Important responsibilities
It keeps common calculations in one place so objects do not repeat them.

## Inputs and outputs
Each helper receives the values shown in its function signature and returns a calculated value; it normally does not own instance state.

## Relationships
Shared by controller, HUD, plants, weapons, and other systems. It has no parent or child relationship.

## Learning concepts
A utility function is a small tool that can be reused by many parts of a game. Return values carry results back to the caller.

## Known notes
This file is a mixed collection of general helpers, so callers are the best guide to the meaning of any less frequently used function.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
