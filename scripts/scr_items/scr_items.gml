// =============================================================================
// SCRIPT:      scr_items
// TYPE:        Item Subsystem
// =============================================================================

/// @description Centralized item management and item utility system.
///
/// Responsibilities:
/// - Item creation/configuration
/// - Inventory item definitions
/// - Vegetable/item behavior data
/// - Item lookup helpers
/// - Throw configuration data
/// - Pickup interaction support
/// - Shared item utility functions
///
/// Public API:
/// - Item_Create()
/// - Item_Throw()
///
/// Notes:
/// - Item definitions should remain data-driven
/// - Shared interaction logic should remain centralized
/// - Thrown-item behavior belongs in obj_item_thrown
/// - Avoid duplicating item logic across objects
/// - Supports inventory and world item systems

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

function Item_Throw(_o) {

    var o = _o;

    if (!instance_exists(o)) return;
	//if (!variable_instance_exists(id, "start_x")) return;
	
    if (ds_list_size(o.inventory) <= 0) return;

    var item = o.inventory[| o.active_item_index];
    if (item == undefined) return;


    /// =========================
    /// CREATE OBJECT (SAFE)
    /// =========================
//    var obj = asset_get_index("obj_item_thrown");
//	show_debug_message(string(obj));

    var t = instance_create_layer(o.x, o.y, "Instances", obj_item_thrown);

    t.item = item;
    t.sprite_index = item.sprite;
	t.max_distance = item.throw_distance
	t.drag = item.drag;
	t.start_x = o.x;
	t.start_y = o.y;

    /// =========================
    /// AIM
    /// =========================
    var mx = Mouse_GetWorldX();
    var my = Mouse_GetWorldY();

    var dir = point_direction(o.x, o.y, mx, my);


    /// =========================
    /// VELOCITY
    /// =========================
    var ispeed = item.throw_speed;

    t.vx = lengthdir_x(ispeed, dir);
    t.vy = lengthdir_y(ispeed, dir);

    t.image_angle = dir;


    /// =========================
    /// REMOVE ITEM
    /// =========================
    item.count--;

    if (item.count <= 0) {

        ds_list_delete(o.inventory, o.active_item_index);

        if (ds_list_size(o.inventory) > 0) {
            o.active_item_index = clamp(o.active_item_index, 0, ds_list_size(o.inventory) - 1);
        } else {
            o.active_item_index = 0;
        }
    }
}
