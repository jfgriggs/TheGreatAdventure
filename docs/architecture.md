# Project Architecture

## The Big Idea

The game is divided into objects and shared scripts. Objects represent things in the world. Scripts provide reusable rules that many objects can use.

See the editable [architecture diagram](diagrams/architecture.drawio) for a visual map of these layers and the typical frame update.

The main design rule is:

> Parents contain shared behavior. Children contain configuration.

This is an object-oriented idea called **inheritance**. A child object receives behavior from its parent and can add a small amount of specialized setup.

## Main Layers

- **Startup:** `obj_controller` and `scr_globals` prepare the game.
- **World queries:** `scr_tiles` answers questions about the tilemap.
- **Movement:** `scr_movement` handles velocity, acceleration, terrain, and collision.
- **Decisions:** state scripts decide what an object wants to do.
- **Gameplay systems:** animals, items, weapons, damage, and utilities implement shared rules.
- **Presentation:** Draw events, sprites, particles, and sounds show the result to the player.

## Ownership

Ownership means knowing which part of the program is responsible for something. The controller owns global game state and controller-created resources. A player owns its inventory and weapon list. An object that creates a data structure must also clean it up.

Clear ownership prevents two systems from changing the same thing accidentally.

## A Typical Update

1. The controller establishes the game state.
2. A gameplay object checks whether the game is playing.
3. Input or AI creates an intention.
4. A state machine chooses the current behavior.
5. A shared system performs movement, damage, or another action.
6. Draw events display the current state.

States decide; shared systems perform. This keeps state code easier to understand.

## Legacy Boundaries

Some enemy objects use older movement fields and update paths. That is a known boundary. It should be studied as a complete family before anyone tries to make it match the player and animal movement system.
