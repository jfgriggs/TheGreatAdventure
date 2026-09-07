# `objects/obj_controller/Step_0.gml`

## What it does
Advances controller-owned game timing and manages global game-state transitions during active play.

## When it runs
Once per frame for the controller.

## Important responsibilities
It observes gameplay conditions, updates `global.game_time`, and controls transitions such as starting or ending play.

## Inputs and outputs
Reads `global.game_state` and game conditions; mutates global state and timers owned by the controller.

## Relationships
Players, HUD, and gameplay objects observe these globals. The controller is the owner, not a child of another gameplay object.

## Learning concepts
A global state is shared information. A single owner prevents several objects from disagreeing about whether play is active.

## Known notes
Gameplay updates elsewhere are expected to gate on `GAME_STATE.PLAYING`.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
