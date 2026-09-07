// ===========================================================================
// OBJECT:       obj_garden_watermelon
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Garden Watermelon Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures a watermelon plant with ITEM.WATERMELON, its garden sprite, and pickup sound.
//
// ===========================================================================

event_inherited();

// --------------------------------------------------
// Crop Configuration
// --------------------------------------------------

// Inventory item granted on harvest.
item_type = ITEM.WATERMELON;

// --------------------------------------------------
// Visuals
// --------------------------------------------------

sprite_index = spr_garden_watermelon;

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
