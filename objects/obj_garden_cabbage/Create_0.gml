// ===========================================================================
// OBJECT:       obj_garden_cabbage
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Garden Cabbage Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures a plant to grow cabbage by inheriting shared plant setup, then setting ITEM.CABBAGE, spr_garden_cabbage, and the pickup sound.
//
// ===========================================================================

event_inherited();

// --------------------------------------------------
// Crop Configuration
// --------------------------------------------------

// Inventory item granted on harvest.
item_type = ITEM.CABBAGE;

// --------------------------------------------------
// Visuals
// --------------------------------------------------

sprite_index = spr_garden_cabbage;

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
