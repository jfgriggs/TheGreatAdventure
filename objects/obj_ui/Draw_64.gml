// =============================================================================
// OBJECT:      obj_ui
// EVENT:       Draw GUI
// SYSTEM:      User Interface Rendering
// =============================================================================

/// @description Draws gameplay-independent user interface elements, menus, prompts, notifications, and interaction feedback.
///
/// Responsibilities:
/// - Draw menus and interface panels
/// - Draw interaction prompts
/// - Draw notifications/messages
/// - Draw contextual UI elements
/// - Draw temporary interface effects
/// - Draw optional debug UI
///
/// Notes:
/// - Gameplay HUD belongs in obj_hud
/// - Global overlays belong in obj_controller
/// - Keep rendering logic presentation-focused
/// - Avoid gameplay/state modification during drawing

var p = global.player_object;

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