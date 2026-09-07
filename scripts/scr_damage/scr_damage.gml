// ===========================================================================
// SCRIPT:       scr_damage
// REVISION:     1.0.0
// SYSTEM:       Damage System
// ARCHITECTURE: Shared Damage System
//
// DESCRIPTION:
// Defines damage helpers that apply hit points, invincibility timing, knockback, and death behavior to damageable instances.
//
// ===========================================================================

/// @function Damage_Apply
/// @description Handles damage apply for this file's subsystem.
/// @param {Any} target Input used by Damage_Apply.
/// @param {Any} amount Input used by Damage_Apply.
/// @param {Any} source Input used by Damage_Apply.
/// @returns {Any} The result of the operation, when it produces one.
function Damage_Apply(target, amount, source) {
	show_debug_message(string(amount) + " DAMAGE from " + string(source));

	// --- SAFETY ---
	if (!instance_exists(target)) {
		return;
	}

	// --- INVINCIBILITY FRAMES ---
	if (target.invincible_timer > 0) {
		return;
	}

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
	Screen_Shake(8, 30);

	// --- DEATH ---
	if (target.hp <= 0) {
		target.hp = 0;

		if (variable_instance_exists(target, "is_dead")) {
			target.is_dead = true;
		}

		   // Trigger game over globally
		if (instance_exists(obj_controller)) {
			global.game_state = GAME_STATE.GAME_OVER;
			obj_controller.fade_target = 1;
			audio_play_sound(snd_game_over, 1, false);
			Screen_Shake(8, 20);
		}
	}
}

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
