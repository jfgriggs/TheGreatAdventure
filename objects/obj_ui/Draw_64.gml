// ===========================================================================
// OBJECT:       obj_ui
// EVENT:        Draw
// REVISION:     1.0.0
// SYSTEM:       Ui Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Draws the UI overlay elements handled by the base UI object when the expected player or other instance is present.
//
// ===========================================================================

var p = global.player_object;

if (!instance_exists(p)) {
	exit;
}

// HP
draw_text(20, 20, "HP: " + string(p.hp));

// Weapon
draw_text(20, 50, "Weapon: " + p.weapon.name);

// Item
draw_text(20, 80, "Item: " + string(p.active_item));

// Time
draw_text(20, 110, "Time: " + string(global.game_time div 60));

// Score
draw_text(20, 140, "Score: " + string(global.points));

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
