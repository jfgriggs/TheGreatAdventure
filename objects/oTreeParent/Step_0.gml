// ===========================================================================
// OBJECT:       oTreeParent
// EVENT:        Step
// REVISION:     1.0.0
// SYSTEM:       Otreeparent Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Runs shared per-frame behavior for the legacy tree parent, including its world interaction or presentation state.
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
