// Inputs
rightKey = keyboard_check(vk_right);
leftKey = keyboard_check(vk_left);
upKey = keyboard_check(vk_up);
downKey = keyboard_check(vk_down);

// Movement
#region
	// Get direction
	var _horizKey = rightKey - leftKey;
	var _vertKey = downKey - upKey;
	moveDir = point_direction(0, 0, _horizKey, _vertKey);
	
	//  Get x and y speeds
	var _spd = 0;
	var _inputLevel = point_distance(0,  0, _horizKey, _vertKey);
	_inputLevel = clamp(_inputLevel, 0, 1);
	_spd = moveSpd * _inputLevel;
	
	xspd = lengthdir_x(_spd, moveDir);
	yspd = lengthdir_y(_spd, moveDir);
   	// Collision check
	if place_meeting(x + xspd, y, oWater) xspd = 0;
	if place_meeting(x, y + yspd, oWater) yspd = 0;
	
	// Move player
	x += xspd;
	y += yspd;
	
	// Depth
	depth = -bbox_bottom;
	
#endregion	
	

// Player Aiming
#region
	centerY = y - centerYOffset;
	
	// Aim
	aimDir = point_direction(x, centerY, mouse_x, mouse_y);

#endregion
	
	

// Sprite Control
#region	
	// Make sure the sprite is facing in the correct direction
	face = round(aimDir/90);
	if face == 4 face = 0;
	
	// Stop animating
	if xspd == 0 && yspd == 0 {
		image_index = 0
	}
	
	// Set player sprite
	mask_index = sprite[3];
	sprite_index = sprite[face];
	
#endregion
	