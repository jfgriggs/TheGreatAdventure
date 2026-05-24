/// @description obj_garden_plant : Step Event


// --------------------------------------------------
// Growth Timer
// --------------------------------------------------

growth_timer--;

if (growth_timer <= 0) {

    switch (image_index) {

        // ------------------------------------------
        // Sprout -> Young
        // ------------------------------------------

        case PLANT_STAGE.SPROUT:
        {
            image_index = PLANT_STAGE.YOUNG;

            growth_timer = growth_time;

            break;
        }


        // ------------------------------------------
        // Young -> Fruiting
        // ------------------------------------------

        case PLANT_STAGE.YOUNG:
        {
            image_index = PLANT_STAGE.FRUITING;

            // Pause indefinitely until harvested.
            growth_timer = -1;

            break;
        }


        // ------------------------------------------
        // Harvested -> Sprout
        // ------------------------------------------

        case PLANT_STAGE.HARVESTED:
        {
            image_index = PLANT_STAGE.SPROUT;

            growth_timer = growth_time;

            harvested = false;

            break;
        }
    }
}


// --------------------------------------------------
// Harvest Logic
// --------------------------------------------------

// Only harvest while fruiting.
if (image_index == PLANT_STAGE.FRUITING) {

    var _player = collision_circle(
        x,
        y,
        pickup_radius,
        obj_player,
        false,
        true
    );

    if (instance_exists(_player)) {

        // --------------------------------------
        // Add Inventory Item
        // --------------------------------------

		var _item = Item_Create(item_type);

	    // --------------------------------------
	    // Attempt Pickup
	    // --------------------------------------
	
		if (Inventory_Add_Item(_player, _item)) {

		    // ----------------------------------
		    // Harvest Sound
		    // ----------------------------------

		    if (harvest_sound != noone) {

		        audio_play_sound(harvest_sound, 1, false);
		    }


		    // ----------------------------------
		    // Enter Harvested State
		    // ----------------------------------

		    harvested = true;

		    image_index = PLANT_STAGE.HARVESTED;

		    growth_timer = growth_time;
		}
    }
}