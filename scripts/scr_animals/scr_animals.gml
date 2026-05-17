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
        var dir = point_direction(0, 0, _animal.vx, _animal.vy);

        var face = round(dir / 90);

        if (face == 4) {
            face = 0;
        }

        _animal.face = face;
    }

    // =========================================================
    // SPRITES
    // =========================================================
    _animal.mask_index = _animal.sprite_set[3];
    _animal.sprite_index = _animal.sprite_set[_animal.face];

    // =========================================================
    // IDLE FRAME
    // =========================================================
    if (_animal.vx == 0 && _animal.vy == 0) {
        _animal.image_index = 0;
    }
}


function Animal_LikesItem(o, item_struct) {

    if (item_struct == undefined) return false;

    var item_type = item_struct.type;

    for (var i = 0; i < array_length(o.desired_items); i++) {
        if (o.desired_items[i] == item_type) {
            return true;
        }
    }

    return false;
}


function Animal_Animal_HasLineOfSight(x1, y1, x2, y2) {
    return !collision_line(x1, y1, x2, y2, obj_wall, true, true);
}


function Animal_FindTarget(o) {

    var best = noone;
    var best_dist = 999999;

    /// PRIORITY 1: THROWN ITEMS
    with (obj_item_thrown) {

        if (!Animal_LikesItem(o, item)) continue;

        var d = point_distance(x, y, o.x, o.y);

        if (d < best_dist && d < o.vision_range) {

            if (Animal_Animal_HasLineOfSight(o.x, o.y, x, y)) {
                best = id;
                best_dist = d;
            }
        }
    }

    if (best != noone) {
        o.target_type = "item";
        return best;
    }

    /// PRIORITY 2: PLAYER
    var p = global.player_object;

    if (instance_exists(p)) {

        if (Animal_LikesItem(o, p.active_item)) {

            var d = point_distance(o.x, o.y, p.x, p.y);

            if (d < o.vision_range && Animal_Animal_HasLineOfSight(o.x, o.y, p.x, p.y)) {
                o.target_type = "player";
                return p;
            }
        }
    }

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

    with (obj_item_thrown) {
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