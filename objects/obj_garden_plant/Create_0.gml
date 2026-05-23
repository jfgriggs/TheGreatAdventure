/// @description obj_garden_plant : Create Event


// --------------------------------------------------
// Crop Configuration
// --------------------------------------------------

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

image_index = irandom_range(
    PLANT_STAGE.SPROUT,
    PLANT_STAGE.HARVESTED
);