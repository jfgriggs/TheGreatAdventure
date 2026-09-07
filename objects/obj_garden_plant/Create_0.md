# `objects/obj_garden_plant/Create_0.gml`

## What it does
Initializes a garden plant's item type, growth timing, harvest sound, sprite, pickup radius, and starting growth stage.

## When it runs
It runs when a plant instance is created.

## Important responsibilities
It establishes the shared fields used by plant growth and harvesting, including `growth_timer`, `growth_time`, `harvested`, and `image_index`.

## Inputs and outputs
It reads constants and the pickup sound resource and writes plant runtime fields; it has no parameters or return value.

## Relationships
Parent of vegetable plant children. `Step_0` uses these fields and `scr_items` handles the resulting item.

## Learning concepts
A field is named information stored on an instance. A timer is a value counted down to trigger an event.

## Known notes
The initial stage and timer are randomized, so newly placed plants may not all look identical.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
