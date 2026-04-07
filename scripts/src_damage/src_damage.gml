function apply_damage(target, amount, source) {

    // --- SAFETY ---
    if (!instance_exists(target)) return;

    // --- INVINCIBILITY FRAMES ---
    if (target.invincible_timer > 0) return;

    // --- APPLY DAMAGE ---
    target.hp -= amount;
    target.invincible_timer = target.iframes;
	
	// --- PLAY SOUND EFFECT ---	
	audio_play_sound(snd_hit, 1, false);

    // --- KNOCKBACK ---
    if (instance_exists(source)) {
		var dx = target.x - target.prev_x;
		var dy = target.y - target.prev_y;

		// If no movement, fallback
		if (dx == 0 && dy == 0) {
		    dx = random_range(-1, 1);
		    dy = random_range(-1, 1);
		}

		// Normalize
		var len = point_distance(0, 0, dx, dy);
		if (len > 0) {
		    dx /= len;
		    dy /= len;
		}

		// Apply opposite direction (push backward)
		target.knockback_x = -dx * target.knockback_force;
		target.knockback_y = -dy * target.knockback_force;

        //var dir = point_direction(source.x, source.y, target.x, target.y);

        //target.knockback_x = lengthdir_x(target.knockback_force, dir);
        //target.knockback_y = lengthdir_y(target.knockback_force, dir);

    } else {
        // fallback if no source
        target.knockback_x = 0;
        target.knockback_y = 0;
    }

	if (variable_instance_exists(target, "sm")) {
		target.sm.change(Player_Hit(target.sm));
	}

	// --- FLASH / BLINK ---
	if (variable_instance_exists(target, "flash_timer")) {
		target.flash_timer = 60;
	}
	screen_shake(8, 30);

    // --- DEATH ---
	if (target.hp <= 0) {
	    target.hp = 0;

	    if (variable_instance_exists(target, "is_dead")) {
	        target.is_dead = true;
	    }

	    // 🔥 Trigger game over globally
	    if (instance_exists(obj_controller)) {
	        obj_controller.game_state = GAME_STATE.GAME_OVER;
			obj_controller.fade_target = 1;
			audio_play_sound(snd_game_over, 1, false);
			screen_shake(8, 20);			
	    }
	}
}