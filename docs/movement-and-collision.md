# Movement And Collision

`scr_movement` provides one shared movement pipeline for objects that use it.

A moving object initializes input, velocity, acceleration, speed limits, impulses, damping, and tile-check callbacks. Then it calls:

```gml
Movement_Update(self);
```

`self` means the current instance. Passing the instance lets one generic function work for players and animals.

## Pipeline

The system reads input, accelerates, limits speed, adds impulses such as knockback, applies damping, checks terrain, and resolves collision. If full diagonal movement is blocked, it tries horizontal and vertical movement separately.

Tile rules are callbacks. A player, animal, projectile, or thrown item can provide a different tile-check function without copying the entire movement system.

This is an example of **composition**: an object is assembled with small behaviors instead of making every object a separate special system.
