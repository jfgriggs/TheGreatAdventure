# `scripts/scr_enemy_predator_states/scr_enemy_predator_states.gml`

## What it does
Defines predator enemy states for patrolling, detecting a player, chasing, and attacking at close range.

## When it runs
Predator enemy instances update their current state during gameplay Steps.

## Important responsibilities
The states make decisions from distance, vision, attack range, and timers, then ask the enemy to move or attack.

## Inputs and outputs
Constructors receive a state machine and return callback structs. Callbacks read the owner enemy and player and mutate enemy intent or create combat effects.

## Relationships
Bear, wolf, and hunter objects use enemy state machines; their parent and child Create events supply fields such as speed, health, and ranges.

## Learning concepts
A state transition changes the rule currently controlling an object. Distance checks let an enemy choose a new state.

## Known notes
Enemy movement fields and update paths differ from player and animal movement. This is documented legacy behavior, not normalized here.
