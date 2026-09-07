// ===========================================================================
// OBJECT:       obj_trap
// EVENT:        Step
// REVISION:     1.0.0
// SYSTEM:       Trap Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Counts down a trap, destroys it when its lifetime ends, and damages nearby supported enemies.
//
// ===========================================================================

if (global.game_state != GAME_STATE.PLAYING) {
	exit;
}

lifetime--;
if (lifetime <= 0) {
	instance_destroy();
}

// Affect enemies
with (obj_enemy_archer) {
	if (point_distance(x, y, other.x, other.y) < other.radius) {
		speed *= 0.9;
	}
}

with (obj_enemy_wolf) {
	if (point_distance(x, y, other.x, other.y) < other.radius) {
		speed *= 0.9;
	}
}

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
