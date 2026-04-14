// File: src_screen_shake.gml

function screen_shake(amount, duration) {
	var c = obj_controller;
	
	if (instance_exists(c)) {
		c.shake_strength = amount;
		c.shake_timer = duration;
	}
}