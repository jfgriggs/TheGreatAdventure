# `objects/obj_pen/Step_0.gml`

## What it does
This event is intended to update shared pen interactions, but its active body is empty; the visible animal-scoring code is commented out.

## When it runs
Once per frame for each pen instance.

## Important responsibilities
No active runtime responsibility is performed here.

## Inputs and outputs
No active fields are read or changed.

## Relationships
It belongs to parent `obj_pen`; child pen objects select accepted animals.

## Learning concepts
Commented code is not executed. An event can exist as a planned extension without currently changing the game.

## Known notes
The commented example checks animals, increments saved counts and points, and destroys an instance, but none of that currently runs.
