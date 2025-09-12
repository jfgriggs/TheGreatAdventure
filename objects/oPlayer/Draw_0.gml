// Draw the weapon when behind player
	if aimDir >= 0 && aimDir < 180 draw_my_weapon();

// Draw the player
	draw_self();

// Draw the weapon when in front of player
	if aimDir >= 180 && aimDir < 360 draw_my_weapon();

