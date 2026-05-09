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
/// - Item_Create(_type)
/// - Item_Throw(_o)
/// - Inventory_Select_Next_Active_Item(_player, _previous_item_name)
/// - Inventory_Add_Item(_player, _item)
/// - Inventory_Remove_Active_Item(_player)
/// - Inventory_Select_Next_Stack(_player)
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
		        drag: 0.985,
				life: 2400
		    };

		case ITEM.CORN:
		    return {
		        name: "corn",
		        sprite: spr_item_corn,
		        sprite_large: spr_item_corn_large,
		        count: 1,

		        throw_speed: 10,
		        throw_distance: 220,
		        drag: 0.975,
				life: 2400
		    };

		case ITEM.TOMATO:
		    return {
		        name: "tomato",
		        sprite: spr_item_tomato,
		        sprite_large: spr_item_tomato_large,
		        count: 1,

		        throw_speed: 9,
		        throw_distance: 180,
		        drag: 0.96,
				life: 1800
		    };

		case ITEM.PUMPKIN:
		    return {
		        name: "pumpkin",
		        sprite: spr_item_pumpkin,
		        sprite_large: spr_item_pumpkin_large,
		        count: 1,

		        throw_speed: 7,
		        throw_distance: 130,
		        drag: 0.93,
				life: 3600
		    };

		case ITEM.WATERMELON:
		    return {
		        name: "watermelon",
		        sprite: spr_item_watermelon,
		        sprite_large: spr_item_watermelon_large,
		        count: 1,

		        throw_speed: 6,
		        throw_distance: 100,
		        drag: 0.90,
				life: 3600
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
    if (ds_map_size(o.inventory) <= 0) return;
    if (o.active_item = undefined) return;

	item = o.active_item;

    /// =========================
    /// CREATE OBJECT (SAFE)
    /// =========================
    var t = instance_create_layer(o.x, o.y, "Instances", obj_item_thrown);

    t.item = item;
    t.sprite_index = item.sprite;
	t.drag = item.drag;
	t.start_x = o.x;
	t.start_y = o.y;

    /// =========================
    /// AIM
    /// =========================
    var mx = Mouse_GetWorldX();
    var my = Mouse_GetWorldY();

    var dir = point_direction(o.x, o.y, mx, my);

	// If the mouse location is less that the throw_distance 
	// throw to the mouse location, otherwise, it travels the
	// full throw_distance
	t.max_distance = min(item.throw_distance, point_distance(o.x, o.y, mx, my));


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
    Inventory_Remove_Active_Item(o);
}

// =============================================================================
// FUNCTION:    Inventory_Select_Next_Active_Item
// SYSTEM:      Inventory
// =============================================================================

/// @function Inventory_Select_Next_Active_Item(player, previous_item_name)
///
/// @description
/// Selects the next active inventory item after one is removed/thrown.
///
/// Priority:
/// 1. Another item of the same type
/// 2. Next valid inventory index
/// 3. Clear active item if inventory empty
///
/// @param {instance} player
/// @param {string} previous_item_name

function Inventory_Select_Next_Active_Item(_player, _previous_item_name) {

    var inventory = _player.inventory;
    var count = ds_list_size(inventory);

    // -------------------------------------------------
    // Empty inventory
    // -------------------------------------------------

    if (count <= 0) {
        _player.active_item_index = -1;
        _player.active_item = undefined;
        return;
    }


    // -------------------------------------------------
    // Prefer same item type
    // -------------------------------------------------

    for (var i = 0; i < count; i++) {

        var item = inventory[| i];

        if (item.name == _previous_item_name) {

            _player.active_item_index = i;
            _player.active_item = item;

            return;
        }
    }


    // -------------------------------------------------
    // Fallback:
    // clamp to valid index
    // -------------------------------------------------

    _player.active_item_index = clamp(
        _player.active_item_index,
        0,
        count - 1
    );

    _player.active_item = inventory[| _player.active_item_index];
}


function Inventory_Add_Item(_player, _item) {
    var key = _item.name;

    // -------------------------------------------------
    // Create stack if missing
    // -------------------------------------------------
    if (!ds_map_exists(_player.inventory, key)) {
        var stack = ds_list_create();
        ds_map_add(
            _player.inventory,
            key,
            stack
        );
    }

    // -------------------------------------------------
    // Add item to stack
    // -------------------------------------------------
    var stack = _player.inventory[? key];
    ds_list_add(stack, _item);

    // -------------------------------------------------
    // Auto-select if none active
    // -------------------------------------------------
    if (!is_struct(_player.active_item)) {
        _player.active_item_name = key;
        _player.active_item = stack[| 0];
    }
}

function Inventory_Remove_Active_Item(_player) {
    // -------------------------------------------------
    // Safety
    // -------------------------------------------------
    if (!is_struct(_player.active_item)) {
        return undefined;
    }

    var key = _player.active_item_name;

    if (!ds_map_exists(_player.inventory, key)) {
        return undefined;
    }

    var stack = _player.inventory[? key];

    if (ds_list_size(stack) <= 0) {
        return undefined;
    }

    // -------------------------------------------------
    // Remove first item from stack
    // -------------------------------------------------
    var item = stack[| 0];
    ds_list_delete(stack, 0);

    // -------------------------------------------------
    // Empty stack cleanup
    // -------------------------------------------------
    if (ds_list_size(stack) <= 0) {
        ds_list_destroy(stack);
        ds_map_delete(_player.inventory, key);
        Inventory_Select_Next_Stack(_player)
    } else {
        _player.active_item = stack[| 0];
    }

    return item;
}

function Inventory_Select_Next_Stack(_player) {
    var keys = ds_map_keys_to_array(_player.inventory);
    if (array_length(keys) <= 0) {
        _player.active_item_name = "";
        _player.active_item = undefined;
        return;
    }

    // -------------------------------------------------
    // Select first available stack
    // -------------------------------------------------
    var key = keys[0];
    var stack = _player.inventory[? key];
    _player.active_item_name = key;
    _player.active_item = stack[| 0];
}