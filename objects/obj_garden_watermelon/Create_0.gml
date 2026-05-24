/// @description obj_garden_corn : Create Event

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
