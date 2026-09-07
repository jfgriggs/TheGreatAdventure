// ===========================================================================
// OBJECT:       obj_garden_corn
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Garden Corn Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures the shared plant as corn with ITEM.CORN, the corn garden sprite, and the pickup sound.
//
// ===========================================================================

event_inherited();

// --------------------------------------------------
// Crop Configuration
// --------------------------------------------------

// Inventory item granted on harvest.
item_type = ITEM.CORN;

// --------------------------------------------------
// Visuals
// --------------------------------------------------

sprite_index = spr_garden_corn;

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
