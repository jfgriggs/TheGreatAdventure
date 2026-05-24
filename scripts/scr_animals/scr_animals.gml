// =============================================================================
// SCRIPT:      scr_animals
// TYPE:        Animal Subsystem
// =============================================================================

/// @description Centralized animal management, configuration, and shared animal utility system.
///
/// Responsibilities:
/// - Animal data creation
/// - Animal configuration lookup
/// - Preferred food handling
/// - Follow behavior helpers
/// - Pen validation support
/// - Shared animal utility functions
/// - Runtime animal state support
///
/// Public API:
/// - Animal_Create()
/// - Animal_LikesItem()
/// - Animal_HasLineOfSight()
/// - Animal_FindTarget()
/// - Animal_IsSafe() - TBD
///
/// Notes:
/// - Animal definitions should remain data-driven
/// - Shared AI behavior belongs in scr_animal_states
/// - Shared movement logic belongs in scr_movement
/// - Avoid duplicating species logic across objects
/// - Supports all obj_animal_* child objects

function Animal_Update_Facing(_animal) {
	// =========================================================
	// DETERMINE FACING
	// =========================================================
	if (_animal.vx != 0 || _animal.vy != 0) {
		var dir = point_direction(
			_animal.x,
			_animal.y,
			_animal.x + _animal.vx,
			_animal.y + _animal.vy
		);

		// =====================================================
		// RIGHT
		// =====================================================
		if (dir >= 315 || dir < 45) {
			_animal.face = 0;

			// =====================================================
			// UP
			// =====================================================
		} else if (dir >= 45 && dir < 135) {
			_animal.face = 1;

			// =====================================================
			// LEFT
			// =====================================================
		} else if (dir >= 135 && dir < 225) {
			_animal.face = 2;

			// =====================================================
			// DOWN
			// =====================================================
		} else {
			_animal.face = 3;
		}
	}

	// =========================================================
	// UPDATE SPRITES
	// =========================================================
	if (array_length(_animal.sprite_set) > 0) {
		var new_sprite = _animal.sprite_set[_animal.face];

		if (_animal.sprite_index != new_sprite) {
			_animal.sprite_index = new_sprite;
		}

		_animal.mask_index = _animal.sprite_set[3];
	}

	// =========================================================
	// STOP WALK ANIMATION WHEN IDLE
	// =========================================================
	if (_animal.vx == 0 && _animal.vy == 0) {
		_animal.image_index = 0;
	}
}

function Animal_Get_Item_Desire(_animal, _item) {
	// =========================================================
	// INVALID ITEM
	// =========================================================
	if (is_undefined(_item)) {
		return 0;
	}

	if (_item == noone) {
		return 0;
	}

	// =========================================================
	// GET ITEM NAME
	// =========================================================
	var item_name = "";

	// =========================================================
	// ITEM STRUCT
	// =========================================================
	if (is_struct(_item)) {
		if (!variable_struct_exists(_item, "name")) {
			return 0;
		}

		item_name = _item.name;

		// =========================================================
		// ITEM INSTANCE
		// =========================================================
	} else if (instance_exists(_item)) {
		if (!variable_instance_exists(_item, "item")) {
			return 0;
		}

		if (!is_struct(_item.item)) {
			return 0;
		}

		if (!variable_struct_exists(_item.item, "name")) {
			return 0;
		}

		item_name = _item.item.name;
	} else {
		return 0;
	}

	// =========================================================
	// LOOKUP DESIRE
	// =========================================================
	if (variable_struct_exists(_animal.desired_items, item_name)) {
		return _animal.desired_items[$ item_name];
	}

	return 0;
}

function Animal_HasLineOfSight(x1, y1, x2, y2) {
	// =========================================================
	// SIMPLE TILE LOS
	// =========================================================
	var dist = point_distance(x1, y1, x2, y2);

	var steps = ceil(dist / 4);

	for (var i = 0; i <= steps; i++) {
		var t = i / steps;

		var px = lerp(x1, x2, t);
		var py = lerp(y1, y2, t);

		var tile = Tile_Get(px, py);

		if (Tile_Is_Blocking(tile)) {
			return false;
		}
	}

	return true;
}

function Animal_FindTarget(o) {
	var best = noone;
	var best_score = -1;

	/// PRIORITY 1: THROWN ITEMS
	with (obj_item) {
		var desire = Animal_Get_Item_Desire(o, item);
		if (desire <= 0) {
			continue;
		}

		var d = point_distance(x, y, o.x, o.y);

		var desire_score = desire / max(d, 1);

		if (desire_score > best_score && d < o.vision_range) {
			if (Animal_HasLineOfSight(o.x, o.y, x, y)) {
				best = id;
				best_score = desire_score;
			}
		}
	}

	if (best != noone) {
		o.target_type = "item";
		return best;
	}

	return noone;
}

function Animal_IsSafe(_animal) {
	// =========================================================
	// CURRENT TILE
	// =========================================================
	var tile = Tile_Get(_animal.x, _animal.y);

	// =========================================================
	// CHICKEN
	// =========================================================
	if (_animal.animal_type == ANIMAL.CHICKEN) {
		return Tile_Is_Animal_Chicken_Coop(tile);
	}

	// =========================================================
	// COW
	// =========================================================
	if (_animal.animal_type == ANIMAL.COW) {
		return Tile_Is_Animal_Cow_Pasture(tile);
	}

	// =========================================================
	// PIG
	// =========================================================
	if (_animal.animal_type == ANIMAL.PIG) {
		return Tile_Is_Animal_Pig_Pen(tile);
	}

	// =========================================================
	// SHEEP
	// =========================================================
	if (_animal.animal_type == ANIMAL.SHEEP) {
		return Tile_Is_Animal_Sheep_Pasture(tile);
	}

	return false;
}

function Animal_Can_Move_To(_animal, _x, _y) {
	// =========================================================
	// TILE CHECK
	// =========================================================
	var tile = Tile_Get(_x, _y);

	// =========================================================
	// BLOCKING TERRAIN
	// =========================================================
	if (Tile_Is_Blocking(tile)) {
		return false;
	}

	// =========================================================
	// SAFE ANIMALS STAY INSIDE PEN
	// =========================================================
	if (_animal.is_safe) {
		switch (_animal.animal_type) {
			case ANIMAL.CHICKEN:
				return Tile_Is_Animal_Chicken_Coop(tile);

			case ANIMAL.COW:
				return Tile_Is_Animal_Cow_Pasture(tile);

			case ANIMAL.PIG:
				return Tile_Is_Animal_Pig_Pen(tile);

			case ANIMAL.SHEEP:
				return Tile_Is_Animal_Sheep_Pasture(tile);
		}
	}

	return true;
}

function Animal_Get_Pen_Tile(_animal_type) {
	switch (_animal_type) {
		case ANIMAL.CHICKEN:
			return TILE.CHICKEN_COOP;
		case ANIMAL.COW:
			return TILE.COW_PASTURE;
		case ANIMAL.PIG:
			return TILE.PIG_PEN;
		case ANIMAL.SHEEP:
			return TILE.SHEEP_PASTURE;
	}

	return TILE.EMPTY;
}

function Animal_Is_In_Correct_Pen(_animal) {
	var tile = Tile_Get(_animal.x, _animal.y);
	return tile == Animal_Get_Pen_Tile(_animal.animal_type);
}

function Animal_Find_Desired_Item(_animal) {
	var nearest = noone;
	var nearest_dist = 999999;

	with (obj_item) {
		if (item.item_type == other.favorite_food) {
			var dist = point_distance(x, y, other.x, other.y);
			if (dist <= other.attract_range) {
				// Optional LOS hook later
				// collision_line(...)
				if (dist < nearest_dist) {
					nearest_dist = dist;
					nearest = id;
				}
			}
		}
	}

	return nearest;
}

function Animal_Find_Spawn_Position(
	_tile_check_safe,
	_tile_check_blocking,
	_attempts = 1000
) {
	// --------------------------------------------------
	// Attempt Random Positions
	// --------------------------------------------------

	for (var i = 0; i < _attempts; i++) {
		// ----------------------------------------------
		// Random Position
		// ----------------------------------------------

		var _x = irandom(room_width - 1);
		var _y = irandom(room_height - 1);

		// ----------------------------------------------
		// Tile Lookup
		// ----------------------------------------------

		var _tile = Tile_Get(_x, _y);

		// ----------------------------------------------
		// Blocking Terrain
		// ----------------------------------------------

		if (_tile_check_blocking(_tile)) {
			continue;
		}

		// ----------------------------------------------
		// Invalid Safe Area
		// ----------------------------------------------

		if (_tile_check_safe(_tile)) {
			continue;
		}

		// ----------------------------------------------
		// Prevent Animal Overlap
		// ----------------------------------------------

		if (collision_circle(_x, _y, 24, obj_animal, false, true)) {
			continue;
		}

		// ----------------------------------------------
		// Valid Position
		// ----------------------------------------------

		return {x: _x, y: _y};
	}

	// --------------------------------------------------
	// Failed
	// --------------------------------------------------

	show_debug_message("Spawn_Find_Random_Position failed.");

	return undefined;
}

// --------------------------------------------------
// Animal Spawning
// --------------------------------------------------

function Animal_Spawn(_spawn_defs) {
	// --------------------------------------------------
	// Spawn Each Animal Definition
	// --------------------------------------------------

	for (var i = 0; i < array_length(_spawn_defs); i++) {
		var _spawn = _spawn_defs[i];

		// ----------------------------------------------
		// Spawn Requested Count
		// ----------------------------------------------

		for (var j = 0; j < _spawn.count; j++) {
			var _pos = Animal_Find_Spawn_Position(
				_spawn.tile_check_safe,
				_spawn.tile_check_blocking
			);

			if (is_struct(_pos)) {
				instance_create_layer(_pos.x, _pos.y, "Instances", _spawn.object);
			}
		}
	}
}

function Animal_Take_Damage(_animal, _damage, _source) {
	// --------------------------------------------------
	// Ignore Dead Animals
	// --------------------------------------------------

	if (_animal.dead) {
		return;
	}

	// --------------------------------------------------
	// Apply Damage
	// --------------------------------------------------

	_animal.hp -= _damage;

	// --------------------------------------------------
	// Hit Flash
	// --------------------------------------------------

	_animal.flash_timer = _animal.flash_time;

	// --------------------------------------------------
	// Flee Reaction
	// --------------------------------------------------

	_animal.flee_timer = _animal.flee_time;

	_animal.flee_source = _source;

	_animal.flee_speed_current = _animal.flee_speed;

	// --------------------------------------------------
	// Debug
	// --------------------------------------------------

	show_debug_message(
		object_get_name(_animal.object_index) + " fleeing from " + string(_source)
	);

	// --------------------------------------------------
	// Death
	// --------------------------------------------------

	if (_animal.hp <= 0) {
		_animal.dead = true;

		// ----------------------------------------------
		// Death Effect
		// ----------------------------------------------

		Animal_Death_Effect(_animal);

		// ----------------------------------------------
		// Destroy Animal
		// ----------------------------------------------

		instance_destroy(_animal);

		return;
	}
}

function Animal_Death_Effect(_animal) {
	Spark_Spawn(_animal.x, _animal.y);
}
