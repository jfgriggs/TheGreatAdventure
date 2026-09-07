// ===========================================================================
// OBJECT:       obj_garden_plant
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Garden Plant Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Initializes a garden plant's item type, growth timing, harvest sound, sprite, pickup radius, and starting growth stage.
//
// ===========================================================================

item_type = ITEM.NONE;

harvest_sound = snd_item_pickup;

sprite_index = noone;

// --------------------------------------------------
// Growth Configuration
// --------------------------------------------------

// Total time from sprout to fruiting.
growth_time = Seconds(10);

// Randomize current growth progress.
growth_timer = irandom(growth_time);

// --------------------------------------------------
// Harvest Configuration
// --------------------------------------------------

pickup_radius = 8;

// --------------------------------------------------
// Runtime State
// --------------------------------------------------

harvested = false;

// --------------------------------------------------
// Visual Control
// --------------------------------------------------

image_speed = 0;

image_index = irandom_range(PLANT_STAGE.SPROUT, PLANT_STAGE.HARVESTED);

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
