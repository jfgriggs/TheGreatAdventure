// =============================================================================
// SCRIPT:       scr_animals
// REVISION:     1.3.0
// SYSTEM:       Animal Management
// ARCHITECTURE: Shared Animal Subsystem
//
// DESCRIPTION:
// Shared functionality for spawning, locating, targeting, damaging,
// and managing animal instances.
//
// Revision History
// =============================================================================
// 1.3.0
// • Continued documentation standardization.
// • Prepared subsystem for object-owned animal configuration.
// • No gameplay behavior changes.
//
// 1.2.0
// • Removed obsolete Animal_Get_Pen_Tile().
// • Removed obsolete Animal_Is_In_Correct_Pen().
// • Began standardizing documentation.
// =============================================================================

/// @function Animal_Get_Definition
/// @description
/// Returns the immutable configuration for an animal species.
///
/// @param {ANIMAL} _animal_type
/// @returns {Struct}
function Animal_Get_Definition(_animal_type)
{
    static animal_defs =
    [
        undefined, // ANIMAL.NONE

        {
            animal_type: ANIMAL.CHICKEN,
			object: obj_animal_chicken,
            
			// Movement
			move_speed: 1.2,
			wander_speed: 0.8,
			wander_move_time_min: 15,
			wander_move_time_max: 45,
			wander_idle_time_min: 10,
			wander_idle_time_max: 30,
			
			// Habitat
			tile_check_safe: Tile_Is_Animal_Chicken_Coop,
            tile_check_blocking: Tile_Is_Blocking_Animal,
            stay_in_safe_area: true,
			
			// Gameplay
			point_value: 150,
			
			// AI
			vision_range: 260,
			lose_range: 320,
			lose_time_max: Seconds(5),
						
			// Graphics
			sprite_large: spr_animal_chicken_large,
			sprite_set: [
				spr_animal_chicken_right,
				spr_animal_chicken_up,
				spr_animal_chicken_left,
				spr_animal_chicken_down
			],
			
			// Loot
			food_preferences: {
				corn: 2,
			}
        },

        {
            animal_type: ANIMAL.COW,
            object: obj_animal_cow,

			// Movement
			move_speed: 1.2,
			wander_speed: 0.8,
			wander_move_time_min: 15,
			wander_move_time_max: 45,
			wander_idle_time_min: 10,
			wander_idle_time_max: 30,
			
			// Habitat
            tile_check_safe: Tile_Is_Animal_Cow_Pasture,
            tile_check_blocking: Tile_Is_Blocking_Animal,
            stay_in_safe_area: true,
			
			// Gameplay
			point_value: 50,
			
			// AI
			vision_range: 180,
			lose_range: 220,
			lose_time_max: Seconds(4),
						
			// Graphics
			sprite_large: spr_animal_cow_large,
			sprite_set: [
				spr_animal_cow_right,
				spr_animal_cow_up,
				spr_animal_cow_left,
				spr_animal_cow_down,
			],
			
			// Loot
			food_preferences: {
				carrot: 1,
				corn: 2,
				tomato: 4,
				pumpkin: 1,
				watermelon: 1,
			}
		},

        {
            animal_type: ANIMAL.PIG,
            object: obj_animal_pig,

			// Movement
			move_speed: 1.2,
			wander_speed: 0.8,
			wander_move_time_min: 15,
			wander_move_time_max: 45,
			wander_idle_time_min: 10,
			wander_idle_time_max: 30,
			
			// Habitat
            tile_check_safe: Tile_Is_Animal_Pig_Pen,
            tile_check_blocking: Tile_Is_Blocking_Animal,
            stay_in_safe_area: true,
			
			// Gameplay
			point_value: 125,
			
			// AI
			vision_range: 240,
			lose_range: 300,
			lose_time_max: Seconds(5),
						
			// Graphics
			sprite_large: spr_animal_pig_large,
			sprite_set: [
				spr_animal_pig_right,
				spr_animal_pig_up,
				spr_animal_pig_left,
				spr_animal_pig_down,
			],
			
			// Loot
			food_preferences: {
				carrot: 2,
				corn: 2,
				tomato: 4,
				pumpkin: 1,
				watermelon: 1,
			}
		},

        {
            animal_type: ANIMAL.SHEEP,
            object: obj_animal_sheep,

			// Movement
			move_speed: 1.2,
			wander_speed: 0.8,
			wander_move_time_min: 15,
			wander_move_time_max: 45,
			wander_idle_time_min: 10,
			wander_idle_time_max: 30,
			
			// Habitat
            tile_check_safe: Tile_Is_Animal_Sheep_Pasture,
            tile_check_blocking: Tile_Is_Blocking_Animal,
            stay_in_safe_area: true,
			
			// Gameplay
			point_value: 100,
			
			// AI
			vision_range: 220,
			lose_range: 260,
			lose_time_max: Seconds(3),
						
			// Graphics
			sprite_large: spr_animal_sheep_large,
			sprite_set: [
				spr_animal_sheep_right,
				spr_animal_sheep_up,
				spr_animal_sheep_left,
				spr_animal_sheep_down,
			],
			
			// Loot
			food_preferences: {
				carrot: 1,
				corn: 2,
			}
		}
    ];

    if (_animal_type <= ANIMAL.NONE || _animal_type >= array_length(animal_defs))
    {
        show_error("Invalid animal type: " + string(_animal_type), true);
    }

    return animal_defs[_animal_type];
}

/// @function Animal_Update_Facing
/// @description TODO: Document.
function Animal_Update_Facing(_animal) {
	// -----------------------------------------------------------------------------
	// DETERMINE FACING
	// -----------------------------------------------------------------------------
	if (_animal.velocity_x != 0 || _animal.velocity_y != 0) {
		var dir = point_direction(
			_animal.x,
			_animal.y,
			_animal.x + _animal.velocity_x,
			_animal.y + _animal.velocity_y
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

	// -----------------------------------------------------------------------------
	// UPDATE SPRITES
	// -----------------------------------------------------------------------------
	if (array_length(_animal.sprite_set) > 0) {
		var new_sprite = _animal.sprite_set[_animal.face];

		if (_animal.sprite_index != new_sprite) {
			_animal.sprite_index = new_sprite;
		}

		_animal.mask_index = _animal.sprite_set[3];
	}

	// -----------------------------------------------------------------------------
	// STOP WALK ANIMATION WHEN IDLE
	// -----------------------------------------------------------------------------
	if (_animal.velocity_x == 0 && _animal.velocity_y == 0) {
		_animal.image_index = 0;
	}
}

/// @function Animal_Get_Item_Desire
/// @description TODO: Document.
function Animal_Get_Item_Desire(_animal, _item) {
	// -----------------------------------------------------------------------------
	// INVALID ITEM
	// -----------------------------------------------------------------------------
	if (is_undefined(_item)) {
		return 0;
	}

	if (_item == noone) {
		return 0;
	}

	// -----------------------------------------------------------------------------
	// GET ITEM NAME
	// -----------------------------------------------------------------------------
	var item_name = "";

	// -----------------------------------------------------------------------------
	// ITEM STRUCT
	// -----------------------------------------------------------------------------
	if (is_struct(_item)) {
		if (!variable_struct_exists(_item, "name")) {
			return 0;
		}

		item_name = _item.name;

		// -----------------------------------------------------------------------------
		// ITEM INSTANCE
		// -----------------------------------------------------------------------------
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

	// -----------------------------------------------------------------------------
	// LOOKUP DESIRE
	// -----------------------------------------------------------------------------
	if (variable_struct_exists(_animal.food_preferences, item_name)) {
		return _animal.food_preferences[$ item_name];
	}

	return 0;
}

/// @function Animal_HasLineOfSight
/// @description TODO: Document.
function Animal_HasLineOfSight(x1, y1, x2, y2) {
	// -----------------------------------------------------------------------------
	// SIMPLE TILE LOS
	// -----------------------------------------------------------------------------
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

/// @function Animal_FindTarget
/// @description TODO: Document.
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
		return best;
	}

	return noone;
}

/// @function Animal_IsSafe
/// @description TODO: Document.
function Animal_IsSafe(_animal)
{
    if (!is_callable(_animal.tile_check_safe)) {
        return false;
    }

    var tile = Tile_Get(_animal.x, _animal.y);

    return _animal.tile_check_safe(tile);
}

/// @function Animal_Find_Desired_Item
/// @description TODO: Document.
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

/// @function Animal_Find_Spawn_Position
/// @description TODO: Document.
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

/// @function Animal_Spawn
/// @description
/// Spawns the requested animals using the species configuration defined by
/// Animal_Get_Definition().
///
/// @param {Array<Struct>} _spawn_defs
function Animal_Spawn(_spawn_defs)
{
    // -------------------------------------------------------------------------
    // Spawn Each Animal Definition
    // -------------------------------------------------------------------------

    for (var i = 0; i < array_length(_spawn_defs); i++)
    {
        var spawn = _spawn_defs[i];

        // ---------------------------------------------------------------------
        // Species Configuration
        // ---------------------------------------------------------------------

        var cfg = Animal_Get_Definition(spawn.animal_type);

        // ---------------------------------------------------------------------
        // Spawn Requested Count
        // ---------------------------------------------------------------------

        for (var j = 0; j < spawn.count; j++)
        {
            var pos = Animal_Find_Spawn_Position(
                cfg.tile_check_safe,
                cfg.tile_check_blocking
            );

            if (!is_struct(pos))
            {
                continue;
            }

            var animal = instance_create_layer(
                pos.x,
                pos.y,
                "Instances",
                cfg.object
            );

            // This should already be set by the child Create event, but assigning
            // it here keeps the instance self-describing immediately after creation
            // and protects against future refactoring.
            animal.animal_type = spawn.animal_type;
        }
    }
}

/// @function Animal_Take_Damage
/// @description TODO: Document.
function Animal_Take_Damage(_animal, _damage, _source) {
	// --------------------------------------------------
	// Ignore Dead Animals
	// --------------------------------------------------

	if (_animal.is_dead) {
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
		_animal.is_dead = true;

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

/// @function Animal_Death_Effect
/// @description TODO: Document.
function Animal_Death_Effect(_animal) {
	Spark_Spawn(_animal.x, _animal.y);
}