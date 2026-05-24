/// @description obj_projectile : Step Event

// --------------------------------------------------
// Hit Animal
// --------------------------------------------------

var _animal = instance_place(x, y, obj_animal);

if (instance_exists(_animal)) {
	// Prevent self-hit.
	if (_animal == owner) {
		exit;
	}

	Animal_Take_Damage(_animal, damage, owner);

	if (destroy_on_hit) {
		instance_destroy();

		exit;
	}
}

// --------------------------------------------------
// Track Distance
// --------------------------------------------------

distance_traveled += point_distance(xprevious, yprevious, x, y);

// --------------------------------------------------
// Lifetime Expired
// --------------------------------------------------

if (max_distance > 0) {
	if (distance_traveled >= max_distance) {
		instance_destroy();

		exit;
	}
}
