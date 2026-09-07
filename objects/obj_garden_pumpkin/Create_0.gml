// ===========================================================================
// OBJECT:       obj_garden_pumpkin
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Garden Pumpkin Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures a plant to grow pumpkins by selecting ITEM.PUMPKIN, the pumpkin garden sprite, and pickup sound.
//
// ===========================================================================

event_inherited();

// --------------------------------------------------
// Crop Configuration
// --------------------------------------------------

// Inventory item granted on harvest.
item_type = ITEM.PUMPKIN;

// --------------------------------------------------
// Visuals
// --------------------------------------------------

sprite_index = spr_garden_pumpkin;

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
