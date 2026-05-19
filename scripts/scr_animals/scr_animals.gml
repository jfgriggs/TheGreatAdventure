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
			_animal.y + _animal.vy);

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
    if (variable_struct_exists(
        _animal.desired_items,
        item_name
    )) {

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

    /// PRIORITY 2: PLAYER
	/// This cause a problem because active_item is a struct
	/// instead of an object.   When an animal eats the active_item
	/// the player will die instead of an item object
	
    //var p = global.player_object;

    //if (instance_exists(p)) {

    //    if (Animal_Get_Item_Desire(o, p.active_item)) {

    //        var d = point_distance(o.x, o.y, p.x, p.y);

    //        if (d < o.vision_range && Animal_HasLineOfSight(o.x, o.y, p.x, p.y)) {
    //            o.target_type = "player";
    //            return p;
    //        }
    //    }
    //}

    return noone;
}


function Animal_IsSafe(o) {
	return false;
}



function Animal_Get_Pen_Tile(_animal_type) {
    switch (_animal_type) {
        case ANIMAL.CHICKEN: return TILE.CHICKEN_COOP;
        case ANIMAL.COW:     return TILE.COW_PASTURE;
        case ANIMAL.PIG:     return TILE.PIG_PEN;
        case ANIMAL.SHEEP:   return TILE.SHEEP_PASTURE;
    }

    return TILE.EMPTY;
}

function Animal_Is_In_Correct_Pen(_animal) {
    var tile = Tile_Get(_animal.x, _animal.y);
    return (tile == Animal_Get_Pen_Tile(_animal.animal_type));
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

function Animal_Can_Move_To(_animal, _x, _y) {
    // =========================================================
    // TILE COLLISION
    // =========================================================
    var tile = Tile_Get(_x, _y);

    if (Tile_Is_Blocking(tile)) {
        return false;
    }

    // =========================================================
    // ANIMAL SEPARATION
    // =========================================================
    with (obj_animal) {
        // Ignore self
        if (id == _animal.id) {
            continue;
        }

        var d = point_distance(_x, _y, x, y);

        // Minimum spacing between animals
        if (d < 16) {
            return false;
        }
    }
    return true;
}