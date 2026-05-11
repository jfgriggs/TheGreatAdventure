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

enum ANIMAL {
    CHICKEN,
    COW,
	PIG,
	SHEEP
}

function Animal_Create(_type) {

    switch(_type) {

        case ANIMAL.CHICKEN:
            return {

                name: "chicken",

                move_speed: 2,
				point_value: 50,

                vision_range: 180,
                lose_range: 220,
                lose_time_max: 240,

                eat_time_required: 600,

                // MULTIPLE FOODS
                desired_items: [ITEM.CORN, ITEM.TOMATO],

                // DIRECTIONAL SPRITES
                // 0:right, 1:up, 2:left, 3:down
                sprite: [
                    spr_animal_chicken_right,
                    spr_animal_chicken_up,
                    spr_animal_chicken_left,
                    spr_animal_chicken_down
                ],

                // HUD
                sprite_large: spr_animal_chicken_large
            };

        case ANIMAL.COW:
            return {

                name: "cow",

                move_speed: 2.5,
				point_value: 200,

                vision_range: 220,
                lose_range: 260,
                lose_time_max: 180,

                eat_time_required: 480,

                desired_items: [ITEM.CARROT, ITEM.CORN, ITEM.TOMATO],

                sprite: [
                    spr_animal_cow_right,
                    spr_animal_cow_up,
                    spr_animal_cow_left,
                    spr_animal_cow_down
                ],

                sprite_large: spr_animal_cow_large
            };
			
        case ANIMAL.PIG:
            return {

                name: "pig",

                move_speed: 2.5,
				point_value: 150,

                vision_range: 220,
                lose_range: 260,
                lose_time_max: 180,

                eat_time_required: 480,

                desired_items: [ITEM.CARROT, ITEM.CORN, ITEM.TOMATO, ITEM.PUMPKIN, ITEM.WATERMELON],

                sprite: [
                    spr_animal_pig_right,
                    spr_animal_pig_up,
                    spr_animal_pig_left,
                    spr_animal_pig_down
                ],

                sprite_large: spr_animal_pig_large
            };

        case ANIMAL.SHEEP:
            return {

                name: "sheep",

                move_speed: 2.5,
				point_value: 100,

                vision_range: 220,
                lose_range: 260,
                lose_time_max: 180,

                eat_time_required: 480,

                desired_items: [ITEM.CARROT],

                sprite: [
                    spr_animal_sheep_right,
                    spr_animal_sheep_up,
                    spr_animal_sheep_left,
                    spr_animal_sheep_down
                ],

                sprite_large: spr_animal_sheep_large
            };
	}
}


function Animal_LikesItem(o, item_struct) {

    if (item_struct == undefined) return false;

    var item_type = item_struct.type;

    for (var i = 0; i < array_length(o.animal.desired_items); i++) {
        if (o.animal.desired_items[i] == item_type) {
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

        if (d < best_dist && d < o.animal.vision_range) {

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

            if (d < o.animal.vision_range && Animal_Animal_HasLineOfSight(o.x, o.y, p.x, p.y)) {
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