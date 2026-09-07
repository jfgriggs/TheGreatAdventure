// ===========================================================================
// OBJECT:       obj_item_thrown
// EVENT:        Step
// REVISION:     1.0.0
// SYSTEM:       Item Thrown Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Moves a thrown item, stops it at blocking tiles, and turns it back into an inventory item when its travel ends or it reaches a limit.
//
// ===========================================================================

if (!landed) {
	// ------------------------------------------------------------------------
	// Movement
	// ------------------------------------------------------------------------
	var new_x = x + vx;
	var new_y = y + vy;
	var tile = Tile_Get(new_x, new_y);

	if (Tile_Is_Blocking_Thrown_Item(tile)) {
		// Yes - Stop the item
		vx = 0;
		vy = 0;
	} else {
		// No = Set the new location of the item
		x = new_x;
		y = new_y;
	}

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
		i.life = item.life;
		i.max_hp = item.hp;
		i.hp = item.hp;

		instance_destroy();
	}

	// =========================
	// HIT ENEMIES / ANIMALS
	// =========================

	// Example: hit predator
	//with (obj_predator) {

	//    if (point_distance(x, y, other.x, other.y) < 12) {
	//        Damage_Apply(id, other.damage, other);
	//    }
	//}
}

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
