# Startup And Game State

`obj_controller` is the coordinator for a running room. It initializes global values, finds the tilemap, creates particles, starts music, and spawns the first animals.

`scr_globals` defines shared enums and initializes values such as the current game state and game clock.

## Game States

The game can be starting, playing, paused, or over. Most gameplay Step events stop early unless the state is `GAME_STATE.PLAYING`.

This is called **gating**: a small check controls whether an action is allowed to continue. It prevents animals, enemies, and the player from continuing to act while the game is paused or over.

## Dependency Order

Some systems need the controller to exist first. For example, tile queries use the controller's tilemap. A dependency is something one part needs from another part. The documentation for a helper should say when that dependency is required.

Keep global state centralized. If every object invents its own timer or pause flag, the game becomes difficult to reason about.
