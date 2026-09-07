# `objects/obj_hud/Create_0.gml`

## What it does
Creates HUD drawing helper functions for panels and rounded panels.

## When it runs
When the HUD instance is created.

## Important responsibilities
Provides reusable GUI drawing methods to the HUD Draw event.

## Inputs and outputs
The stored helpers receive coordinates, alpha, and radius values and draw panels; they return no gameplay result.

## Relationships
Paired with `Draw_64.gml`; reads player, controller, inventory, animal, and weapon state there.

## Learning concepts
A callback or stored function can be called later by another event. The HUD observes gameplay rather than owning it.

## Known notes
The helper functions are instance fields created during HUD initialization.
