// ===========================================================================
// OBJECT:       obj_garden_tomato
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Garden Tomato Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures a tomato plant with ITEM.TOMATO, its garden sprite, and pickup sound after inherited setup.
//
// ===========================================================================

event_inherited();

// --------------------------------------------------
// Crop Configuration
// --------------------------------------------------

// Inventory item granted on harvest.
item_type = ITEM.TOMATO;

// --------------------------------------------------
// Visuals
// --------------------------------------------------

sprite_index = spr_garden_tomato;

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
