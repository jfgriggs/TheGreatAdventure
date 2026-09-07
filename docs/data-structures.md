# Data Structures

## Structs

A struct is a group of named values. It is useful when several values describe one thing.

```gml
var weapon = {
    name: "bow",
    damage: 2,
    projectile_object: obj_projectile_arrow
};
```

A weapon definition can travel as one value instead of passing three separate variables.

## Arrays

An array is an ordered collection. The game uses arrays for groups such as spawn definitions and directional sprites. Directional sprites use the `FACE` order `RIGHT`, `UP`, `LEFT`, `DOWN`.

## Maps And Lists

A `ds_map` stores values by keys. The player inventory uses a map so an item name can find its stack. A `ds_list` stores an ordered collection, such as weapons in a player's collection.

These are runtime resources. The object that creates them must destroy them during cleanup.

## Enums

Enums give readable names to numbers:

```gml
if (global.game_state == GAME_STATE.PLAYING) {
    // The game is active.
}
```

`GAME_STATE`, `FACE`, `ANIMAL`, `ENEMY`, and `FACTION` are examples.

## Data-Driven Design

Animal, item, and weapon definitions are centralized. This means adding or tuning a type usually changes data in one place instead of spreading values through many objects.

The parent consumes the definition. The child identifies which definition to use.
