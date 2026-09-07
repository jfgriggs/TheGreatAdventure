// ===========================================================================
// SCRIPT:       scr_items
// REVISION:     1.0.0
// SYSTEM:       Items System
// ARCHITECTURE: Shared Items System
//
// DESCRIPTION:
// Creates item definition structs and provides item damage, inventory, and throwing helpers.
//
// ===========================================================================

/// @function Item_Create
/// @description Handles item create for this file's subsystem.
/// @param {Any} _type Input used by Item_Create.
/// @returns {Any} The result of the operation, when it produces one.
function Item_Create(_type) {
	switch (_type) {
		case ITEM.CABBAGE:
			return {
				type: _type,
				name: "cabbage",
				sprite: spr_item_cabbage,
				sprite_large: spr_item_cabbage_large,
				count: 1,
				throw_speed: 12,
				throw_distance: 260,
				drag: 0.985,
				life: 2400,
				hp: 60,
				max_hp: 60,
				nutrition: 1,
			};

		case ITEM.CARROT:
			return {
				type: _type,
				name: "carrot",
				sprite: spr_item_carrot,
				sprite_large: spr_item_carrot_large,
				count: 1,
				throw_speed: 12,
				throw_distance: 260,
				drag: 0.985,
				life: 2400,
				hp: 60,
				max_hp: 60,
				nutrition: 1,
			};

		case ITEM.CORN:
			return {
				type: _type,
				name: "corn",
				sprite: spr_item_corn,
				sprite_large: spr_item_corn_large,
				count: 1,
				throw_speed: 10,
				throw_distance: 220,
				drag: 0.975,
				life: 2400,
				hp: 60,
				max_hp: 60,
				nutrition: 1,
			};

		case ITEM.EGGPLANT:
			return {
				type: _type,
				name: "cabbage",
				sprite: spr_item_eggplant,
				sprite_large: spr_item_eggplant_large,
				count: 1,
				throw_speed: 12,
				throw_distance: 260,
				drag: 0.985,
				life: 2400,
				hp: 60,
				max_hp: 60,
				nutrition: 1,
			};

		case ITEM.PEPPER:
			return {
				type: _type,
				name: "pepper",
				sprite: spr_item_pepper,
				sprite_large: spr_item_pepper_large,
				count: 1,
				throw_speed: 12,
				throw_distance: 260,
				drag: 0.985,
				life: 2400,
				hp: 60,
				max_hp: 60,
				nutrition: 1,
			};

		case ITEM.TOMATO:
			return {
				type: _type,
				name: "tomato",
				sprite: spr_item_tomato,
				sprite_large: spr_item_tomato_large,
				count: 1,
				throw_speed: 9,
				throw_distance: 180,
				drag: 0.96,
				life: 1800,
				hp: 60,
				max_hp: 60,
				nutrition: 1,
			};

		case ITEM.PUMPKIN:
			return {
				type: _type,
				name: "pumpkin",
				sprite: spr_item_pumpkin,
				sprite_large: spr_item_pumpkin_large,
				count: 1,
				throw_speed: 7,
				throw_distance: 130,
				drag: 0.93,
				life: 3600,
				hp: 60,
				max_hp: 60,
				nutrition: 1,
			};

		case ITEM.WATERMELON:
			return {
				type: _type,
				name: "watermelon",
				sprite: spr_item_watermelon,
				sprite_large: spr_item_watermelon_large,
				count: 1,
				throw_speed: 6,
				throw_distance: 100,
				drag: 0.90,
				life: 3600,
				hp: 60,
				max_hp: 60,
				nutrition: 1,
			};
	}
	return {
		name: "Forgot to add new item to scr_items",
		sprite: spr_item_watermelon,
		sprite_large: spr_item_watermelon_large,
		count: 1,
		throw_distance: 50,
	};
}

/// @function Item_Take_Damage
/// @description Handles item take damage for this file's subsystem.
/// @param {Any} _item Input used by Item_Take_Damage.
/// @param {Any} _amount Input used by Item_Take_Damage.
/// @returns {Any} The result of the operation, when it produces one.
function Item_Take_Damage(_item, _amount) {
	// =========================================================
	// WORLD ITEM INSTANCE
	// =========================================================
	if (instance_exists(_item)) {
		if (!variable_instance_exists(_item, "item")) {
			return;
		}

		if (!is_struct(_item.item)) {
			return;
		}

		_item.item.hp -= _amount;
		if (_item.item.hp <= 0) {
			instance_destroy(_item);
		}

		return;
	}

	// =========================================================
	// ITEM STRUCT ONLY
	// =========================================================
	if (is_struct(_item)) {
		if (!variable_struct_exists(_item, "hp")) {
			return;
		}
		_item.hp -= _amount;
	}
}

/// @function Item_Throw
/// @description Handles item throw for this file's subsystem.
/// @param {Any} _o Input used by Item_Throw.
/// @returns {Any} The result of the operation, when it produces one.
function Item_Throw(_o) {
	var o = _o;

	if (!instance_exists(o)) {
		return;
	}
	if (ds_map_size(o.inventory) <= 0) {
		return;
	}
	if (o.active_item == undefined) {
		return;
	}

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

/// @function Inventory_Select_Next_Active_Item
/// @description Handles inventory select next active item for this file's subsystem.
/// @param {Any} _player Input used by Inventory_Select_Next_Active_Item.
/// @param {Any} _previous_item_name Input used by Inventory_Select_Next_Active_Item.
/// @returns {Any} The result of the operation, when it produces one.
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

	_player.active_item_index = clamp(_player.active_item_index, 0, count - 1);

	_player.active_item = inventory[| _player.active_item_index];
}

/// @function Inventory_Add_Item
/// @description Handles inventory add item for this file's subsystem.
/// @param {Any} _player Input used by Inventory_Add_Item.
/// @param {Any} _item Input used by Inventory_Add_Item.
/// @returns {Any} The result of the operation, when it produces one.
function Inventory_Add_Item(_player, _item) {
	var key = _item.name;

	var MAX_INVENTORY_TYPES = 6;
	var MAX_STACK_SIZE = 5;

	// -------------------------------------------------
	// Existing Stack
	// -------------------------------------------------

	if (ds_map_exists(_player.inventory, key)) {
		var stack = _player.inventory[? key];

		// ---------------------------------------------
		// Stack Full
		// ---------------------------------------------

		if (ds_list_size(stack) >= MAX_STACK_SIZE) {
			return false;
		}

		// ---------------------------------------------
		// Add To Existing Stack
		// ---------------------------------------------

		ds_list_add(stack, _item);
	} else {
		// -------------------------------------------------
		// New Stack
		// -------------------------------------------------
		// ---------------------------------------------
		// Inventory Full
		// ---------------------------------------------

		if (ds_map_size(_player.inventory) >= MAX_INVENTORY_TYPES) {
			return false;
		}

		// ---------------------------------------------
		// Create New Stack
		// ---------------------------------------------

		var stack = ds_list_create();

		ds_list_add(stack, _item);

		ds_map_add(_player.inventory, key, stack);
	}

	// -------------------------------------------------
	// Auto Select
	// -------------------------------------------------

	if (!is_struct(_player.active_item)) {
		var stack = _player.inventory[? key];

		_player.active_item_name = key;
		_player.active_item = stack[| 0];
	}

	return true;
}

/// @function Inventory_Remove_Active_Item
/// @description Handles inventory remove active item for this file's subsystem.
/// @param {Any} _player Input used by Inventory_Remove_Active_Item.
/// @returns {Any} The result of the operation, when it produces one.
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
		Inventory_Select_Next_Stack(_player);
	} else {
		_player.active_item = stack[| 0];
	}

	return item;
}

/// @function Inventory_Select_Next_Stack
/// @description Handles inventory select next stack for this file's subsystem.
/// @param {Any} _player Input used by Inventory_Select_Next_Stack.
/// @returns {Any} The result of the operation, when it produces one.
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

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
