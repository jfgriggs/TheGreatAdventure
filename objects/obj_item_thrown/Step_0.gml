// =============================================================================
// OBJECT:      obj_item_thrown
// EVENT:       Step
// SYSTEM:      Thrown Item Runtime Update
// =============================================================================

/// @description Updates thrown-item movement, collision, terrain interaction, and lifecycle behavior.
///
/// Parent Object:
/// - obj_item
///
/// Responsibilities:
/// - Apply movement physics
/// - Process drag/deceleration
/// - Handle collision resolution
/// - Update terrain interaction
/// - Process lifetime expiration
/// - Detect animal interactions
/// - Update visual state/effects
///
/// Notes:
/// - Movement should route through shared systems
/// - Terrain handling should remain centralized
/// - Avoid duplicating projectile logic across item types

/// =========================
/// AIR PHYSICS
/// =========================
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