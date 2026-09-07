# `scripts/scr_player_states/scr_player_states.gml`

## What it does
Defines player states for movement, attacking, taking damage, and other player-controlled transitions.

## When it runs
The player state machine updates the active state during the player Step event.

## Important responsibilities
It interprets player intent, chooses transitions, and coordinates attacks or recovery while leaving shared movement and damage work to their owning systems.

## Inputs and outputs
State constructors receive a state machine and return callback structs. Callbacks read the owner player and input-related fields and mutate state or request actions.

## Relationships
`obj_player` owns the machine and initializes player fields. Weapons, damage, movement, and global game state are dependencies.

## Learning concepts
Input is intent, while a state decides what that intent means right now. Separating decisions from mechanics keeps systems easier to understand.

## Known notes
Player-specific callbacks require a player owner; they are not intended for arbitrary objects that merely have an `sm` field.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
