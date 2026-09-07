# `scripts/scr_animal_states/scr_animal_states.gml`

## What it does
Builds animal behavior states such as wandering, fleeing, and returning or resting, using callbacks for updates and transitions.

## When it runs
An animal's state machine calls the selected state's `on_update` once per Step.

## Important responsibilities
States decide animal intent and when to change behavior; shared movement and collision remain with the animal object and movement system.

## Inputs and outputs
State constructors receive a state machine and capture its owner animal. They return structs with callable callbacks that mutate the owner or request transitions.

## Relationships
`obj_animal` owns the state machine. Species child objects provide data, while this script supplies shared decisions.

## Learning concepts
A state struct is a behavior package. Capturing an owner means the callback remembers which animal it controls.

## Known notes
State behavior depends on the animal fields initialized by the parent and on tile and player queries.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
