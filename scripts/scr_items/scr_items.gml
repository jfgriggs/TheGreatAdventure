// File: scr_items.gml

// To add new items (where "NAME" is the name of the item in lowercase):
//   - create new spr_item_NAME 
//   - create new obj_item_NAME having obj_item as a parent
//   - on obj_item_NAME add create event and override
//        event_inherited();
//        item = Item_Create("NAME");

enum ITEM {
	CARROT,
    CORN,
    TOMATO,
	PUMPKIN,
    WATERMELON
}


function Item_Create(_type) {

    switch(_type) {

		case ITEM.CARROT:
		    return {
		        name: "carrot",
		        sprite: spr_item_carrot,
		        sprite_large: spr_item_carrot_large,
		        count: 1,

		        throw_speed: 12,
		        throw_distance: 260,
		        drag: 0.985
		    };

		case ITEM.CORN:
		    return {
		        name: "corn",
		        sprite: spr_item_corn,
		        sprite_large: spr_item_corn_large,
		        count: 1,

		        throw_speed: 10,
		        throw_distance: 220,
		        drag: 0.975
		    };

		case ITEM.TOMATO:
		    return {
		        name: "tomato",
		        sprite: spr_item_tomato,
		        sprite_large: spr_item_tomato_large,
		        count: 1,

		        throw_speed: 9,
		        throw_distance: 180,
		        drag: 0.96
		    };

		case ITEM.PUMPKIN:
		    return {
		        name: "pumpkin",
		        sprite: spr_item_pumpkin,
		        sprite_large: spr_item_pumpkin_large,
		        count: 1,

		        throw_speed: 7,
		        throw_distance: 130,
		        drag: 0.93
		    };

		case ITEM.WATERMELON:
		    return {
		        name: "watermelon",
		        sprite: spr_item_watermelon,
		        sprite_large: spr_item_watermelon_large,
		        count: 1,

		        throw_speed: 6,
		        throw_distance: 100,
		        drag: 0.90
		    };
	}
	return {
		name: "Forgot to add new item to scr_items",
		sprite: spr_item_watermelon,
		sprite_large: spr_item_watermelon_large,
		count: 1,
		throw_distance: 50
	};
}
