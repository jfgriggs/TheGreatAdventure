// File: obj_animal.gml
// Event: create

show_debug_message("Animal created: " + object_get_name(object_index));

/// =========================
///  --- STATE MACHINE ---
/// =========================
sm = new StateMachine(id);
sm.change(Animal_Idle(sm));

/// =========================
/// ANIMAL SETUP
/// =========================

// Sprite index (facing right)
face = 3;

animal = undefined // change per instance

// Runtime
//input_x = 0;
//input_y = 0;
target = noone;
target_type = "none";

lose_timer = 0;
eat_timer = 0;

wander_dir = irandom(359);
wander_timer = 0;

// Movement helper
move_and_collide_fn = function(_vx, _vy) {
    var o = self;

	//show_debug_message("(x,y)=" + string(o.x) + "," + string(o.y) + " (vx,vy)=" + string(_vx) + "," + string(_vy));

	// --- X ---
    if (_vx != 0) {
        var new_x = o.x + _vx;
        var tile = tile_get(new_x, o.y);

        if (!tile_is_blocking(tile)) {
            o.x = new_x;
        } else {
			// If inside a tile move out of it
			var step = sign(_vx);
            while (!tile_is_blocking(tile_get(o.x + step, o.y))) {
                o.x += step;
            }
        }
    }

    // --- Y ---
    if (_vy != 0) {
        var new_y = o.y + _vy;
        var tile = tile_get(o.x, new_y);

        if (!tile_is_blocking(tile)) {
            o.y = new_y;
        } else {
			// If inside a tile move out of it
            var step = sign(_vy);
            while (!tile_is_blocking(tile_get(o.x, o.y + step))) {
                o.y += step;
            }
        }
    }
};
