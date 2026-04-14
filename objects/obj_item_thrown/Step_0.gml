// File: obj_item_thrown.gml
// Event: step

// Lifetime countdown
life--;

/// =========================
/// AIR PHYSICS
/// =========================
if (!landed) {

	// Move
	x += vx;
	y += vy;

	// Apply drag (THIS CREATES NATURAL SLOWDOWN)
	vx *= drag;
	vy *= drag;

	// Distance traveled
	var dist = point_distance(start_x, start_y, x, y);

	// Smooth stop near end (VERY IMPORTANT)
	var remaining = max_distance - dist;

	if (remaining < 40) {
	    vx *= 0.9;
	    vy *= 0.9;
	}

	// Spin item
	image_angle += (vx + vy) * 2;

	// Stop condition
	if (dist >= max_distance || (abs(vx) < 0.05 && abs(vy) < 0.05)) {

	    var i = instance_create_layer(x, y, "Instances", obj_item);
		
		if (item.throw_speed < 8) {
		    audio_play_sound(snd_item_thud, 1, false);
		}

	    i.item = item;
	    i.sprite_index = item.sprite;

	    instance_destroy();
	}

    // =========================
    // HIT ENEMIES / ANIMALS
    // =========================

    // Example: hit predator
    //with (obj_predator) {

    //    if (point_distance(x, y, other.x, other.y) < 12) {
    //        apply_damage(id, other.damage, other);
    //    }
    //}
}
else {

    // =========================
    // ON GROUND
    // =========================

    if (life <= 0) {
        instance_destroy();
    }
}