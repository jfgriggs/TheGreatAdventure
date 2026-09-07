# `scripts/scr_state_machine/scr_state_machine.gml`

## What it does
Defines the `StateMachine` constructor. It stores the current behavior state, its owner, and time spent in that state.

## When it runs
A gameplay object creates a state machine in its Create event, then calls `change()` and `update()` during later events.

## Important responsibilities
It validates states, calls optional exit and enter callbacks during transitions, resets state time, and calls the current state's `on_update` callback.

## Inputs and outputs
The constructor receives an owner instance. `change(_new_state)` receives a struct state. `update()` changes the machine's `time`; callbacks produce the behavior's effects.

## Relationships
Player, animal, and enemy state scripts create structs for this machine. The owning object supplies the `owner` reference.

## Learning concepts
A state machine is a traffic controller for behavior such as chasing or attacking. A callback is a function stored in a value and called later.

## Known notes
A state must be a struct with a callable `on_update`; `on_enter` and `on_exit` are optional. Invalid states raise an error when changing state.
