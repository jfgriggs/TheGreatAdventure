// ===========================================================================
// OBJECT:       obj_garden_eggplant
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Garden Eggplant Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures an eggplant plant with ITEM.EGGPLANT, its garden sprite, and pickup sound after inherited setup.
//
// ===========================================================================

event_inherited();

// --------------------------------------------------
// Crop Configuration
// --------------------------------------------------

// Inventory item granted on harvest.
item_type = ITEM.EGGPLANT;

// --------------------------------------------------
// Visuals
// --------------------------------------------------

sprite_index = spr_garden_eggplant;

// --------------------------------------------------
// Audio
// --------------------------------------------------

// Replace with your actual sound resource.
harvest_sound = snd_item_pickup;

// --------------------------------------------------
// Optional Crop Tuning
// --------------------------------------------------

// Example:
//
// Faster crops:
// growth_time = room_speed * 5;
//
// Slower crops:
// growth_time = room_speed * 20; 

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
