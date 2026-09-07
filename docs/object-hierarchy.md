# Object Hierarchy

## Parent And Child Objects

A parent object contains behavior that several related objects share. A child object inherits that behavior and supplies identity or configuration.

For example:

```text
obj_animal
|- obj_animal_chicken
|- obj_animal_cow
|- obj_animal_pig
`- obj_animal_sheep
```

The parent handles common animal behavior. A child identifies its species. The same idea is used for players, items, weapons, projectiles, enemies, garden plants, buildings, and pens.

## Create Event Ordering

Create events need an intentional order.

- Set a value **before** `event_inherited()` when the parent reads it immediately.
- Set presentation or tuning **after** `event_inherited()` when the parent creates shared defaults first.

The chicken object sets `animal_type` before inheritance because the animal parent needs that value to load its definition.

## Why This Helps

Without inheritance, every chicken, cow, and sheep would need its own copy of movement, health, and AI code. Copies drift apart and bugs must be fixed repeatedly. A parent gives the family one shared implementation.

## What Belongs In A Child

Good child configuration includes a type enum, sprite choices, a sound, or a small balance adjustment. Large behavior systems belong in the parent or a shared script.

Do not add a child-only rule to a parent just because it is convenient. First ask whether every child really has that rule.
