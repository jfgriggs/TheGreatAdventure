// File: obj_ui.gml
// Event: draw gui

var p = obj_player;

if (!instance_exists(p)) exit;

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