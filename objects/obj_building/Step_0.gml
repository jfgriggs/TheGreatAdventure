// ===========================================================================
// OBJECT:       obj_building
// EVENT:        Step
// REVISION:     1.0.0
// SYSTEM:       Building Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Runs the recurring building interaction or update logic defined for the base building object.
//
// ===========================================================================

var p = global.player_object;

//depth = -y;
// Depth
depth = -bbox_bottom;

with (obj_obstacle) {
	var target = 1;

	if (instance_exists(p)) {
		if (p.x > bbox_left && p.x < bbox_right && p.y > bbox_top && p.y < bbox_bottom) {
			target = 0.45;
		}
	}

	image_alpha = lerp(image_alpha, target, 0.2);
}

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
