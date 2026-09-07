# State Machines

A state machine represents one current mode of behavior, such as idle, moving, attacking, fleeing, or hunting.

The shared `StateMachine` constructor stores an owner, a current state, and state time. A state is a struct with a callable `on_update` function. Optional `on_enter` and `on_exit` functions run when changing states.

## Why Use One

Without a state machine, an object often becomes a long list of unrelated `if` statements. States group the rules for one mode and make transitions visible.

## Responsibilities

- The state decides what the owner wants to do.
- The movement system performs movement.
- The combat system performs damage or attacks.
- The state machine controls entering, updating, and leaving states.

This separation is an example of **single responsibility**: each part has one main job.
