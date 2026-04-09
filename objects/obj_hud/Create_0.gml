draw_panel_fn = function(x1, y1, x2, y2, alpha) {	
    draw_set_color(c_black);
    draw_set_alpha(alpha);
    draw_rectangle(x1, y1, x2, y2, false);
    draw_set_alpha(1);
};

draw_panel_rounded_fn = function (x1, y1, x2, y2, radius, alpha) {

    draw_set_alpha(alpha);

    // Clamp radius so it doesn't break
    var max_r_x = (x2 - x1) / 2;
	var max_r_y = (y2 - y1) / 2;

	var r = min(radius, max_r_x, max_r_y);

    // Center rectangles
    draw_rectangle(x1 + r, y1, x2 - r, y2, false);
    draw_rectangle(x1, y1 + r, x2, y2 - r, false);

    // Corners (circles)
    draw_circle(x1 + r, y1 + r, r, false);
    draw_circle(x2 - r, y1 + r, r, false);
    draw_circle(x1 + r, y2 - r, r, false);
    draw_circle(x2 - r, y2 - r, r, false);

    draw_set_alpha(1);
};