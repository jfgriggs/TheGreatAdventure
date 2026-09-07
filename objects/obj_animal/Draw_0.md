# `objects/obj_animal/Draw_0.gml`

## What it does
Draws the animal sprite and its visual state, including direction or status presentation used by the shared animal object.

## When it runs
GameMaker calls it during the Draw event for each animal instance.

## Important responsibilities
It presents the current animal animation and keeps rendering separate from movement and decision logic.

## Inputs and outputs
It reads the instance's sprite, image, position, and state fields and produces screen pixels; it does not return a value.

## Relationships
This parent Draw event is inherited by animal children unless they override it. It follows the movement and state values set by `Step_0`.

## Learning concepts
Drawing is presentation: it shows state without deciding behavior. Inheritance lets a child reuse a parent's event.

## Known notes
The visible result depends on the sprite and direction values configured by the animal definition.
