var player = obj_player;
var ctrl   = obj_controller;

if (!instance_exists(player)) exit;
if (!instance_exists(ctrl)) exit;

var w = display_get_gui_width();
var h = display_get_gui_height();

var UI_SCALE = 3;

var margin = 16 * UI_SCALE;
var panel_pad = 12 * UI_SCALE;
var line = 28 * UI_SCALE;
var slot_size = 40 * UI_SCALE;
var gap = 8 * UI_SCALE;

draw_set_font(fnt_normal);
draw_set_color(c_white);
draw_set_alpha(1);


/// =========================
/// HEALTH BAR
/// =========================
var hp_panel_w = 440;
var hp_panel_h = 60;

var hp_x1 = margin;
var hp_y1 = margin;
var hp_x2 = hp_x1 + hp_panel_w;
var hp_y2 = hp_y1 + hp_panel_h + margin;

draw_set_color(c_black);
draw_panel_rounded_fn(hp_x1, hp_y1, hp_x2, hp_y2, 10, 1);
draw_set_color(c_white);

var hp_pct = player.hp / 100;

var bar_w = hp_panel_w - panel_pad * 2;
var bar_h = 32;

var bar_x = hp_x1 + panel_pad;
var bar_y = hp_y1 + panel_pad;

// Background
draw_set_color(c_dkgray);
draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);

// Fill
draw_set_color(c_lime);
draw_rectangle(bar_x, bar_y, bar_x + bar_w * hp_pct, bar_y + bar_h, false);

// Centered HP text
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(
    hp_x1 + hp_panel_w / 2,
    bar_y + bar_h + 20,
    "HP: " + string(player.hp)
);

draw_set_halign(fa_left);
draw_set_valign(fa_top);


/// =========================
/// TIMER
/// =========================

// Total seconds
var total_seconds = floor(global.game_time / room_speed);

// Split into minutes + seconds
var minutes = total_seconds div 60;
var seconds = total_seconds mod 60;

// Format seconds with leading zero
var sec_str = string(seconds);
if (seconds < 10) {
    sec_str = "0" + sec_str;
}

// Final string
var time_text = string(minutes) + ":" + sec_str;


// Measure text
var tw = string_width(time_text);
var th = string_height(time_text);

var panel_w = tw + panel_pad * 2;
var panel_h = th + panel_pad * 2;

var tx = w - margin - panel_w;
var ty = margin;

draw_set_color(c_black);
draw_panel_rounded_fn(tx, ty, tx + panel_w, ty + panel_h, 10, 1);
draw_set_color(c_white);

// Draw centered + correct color
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(
    tx + panel_w / 2,
    ty + panel_h / 2,
    time_text
);

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);


/// =========================
/// INVENTORY
/// =========================
var inv_x = margin;
var inv_y = margin + 200;

var inv_count = ds_list_size(player.inventory);

var inv_panel_w = slot_size + panel_pad * 2;
var inv_panel_h = inv_count * (slot_size + gap) - gap + panel_pad * 2;

draw_set_color(c_black);
draw_panel_rounded_fn(inv_x, inv_y, inv_x + inv_panel_w, inv_y + inv_panel_h, 10, 1);
draw_set_color(c_white);

var slot_center_x = inv_x + inv_panel_w / 2;

for (var i = 0; i < inv_count; i++) {

    var item = player.inventory[| i];

    var vy = inv_y + panel_pad + i * (slot_size + gap);

    var center_y = vy + slot_size / 2;

    // Highlight active
    if (i == player.active_item_index) {
        draw_set_alpha(0.5);
		draw_set_color(c_yellow);

        draw_rectangle(
            slot_center_x - slot_size / 2 - 2,
            center_y - slot_size / 2 - 2,
            slot_center_x + slot_size / 2 + 2,
            center_y + slot_size / 2 + 2,
            false
        );
		draw_set_alpha(1);
    }

    draw_set_color(c_white);

    // Slight scale for active item (polish)
    var scale = (i == player.active_item_index) ? 1.2 : 1;

    draw_sprite_ext(
        item.sprite_large,
        0,
        slot_center_x,
        center_y,
        scale,
        scale,
        0,
        c_white,
        1
    );
}


/// =========================
/// WEAPONS
/// =========================
var weap_count = ds_list_size(player.weapons);

var weap_x = w - margin - (slot_size + panel_pad * 2);
var weap_y = margin + 200;

var weap_panel_w = slot_size + panel_pad * 2;
var weap_panel_h = weap_count * (slot_size + gap) - gap + panel_pad * 2;

draw_set_color(c_black);
draw_panel_rounded_fn(weap_x, weap_y, weap_x + weap_panel_w, weap_y + weap_panel_h, 10, 1);
draw_set_color(c_white);

var slot_center_x = weap_x + weap_panel_w / 2;

for (var i = 0; i < weap_count; i++) {

    var weapon = player.weapons[| i];

    var vy = weap_y + panel_pad + i * (slot_size + gap);

    var center_y = vy + slot_size / 2;

    if (i == player.weapon_index) {
        draw_set_alpha(0.5);
		draw_set_color(c_aqua);

        draw_rectangle(
            slot_center_x - slot_size / 2 - 2,
            center_y - slot_size / 2 - 2,
            slot_center_x + slot_size / 2 + 2,
            center_y + slot_size / 2 + 2,
            false
        );
		draw_set_alpha(1);
    }

    draw_set_color(c_white);

    var scale = (i == player.weapon_index) ? 1.2 : 1;

    draw_sprite_ext(
        weapon.sprite_large,
        0,
        slot_center_x,
        center_y,
        scale,
        scale,
        0,
        c_white,
        1
    );
}