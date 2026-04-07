 /// =========================
/// PLAYER STATE: IDLE
function Player_Idle(_sm) {

    return {

        sm: _sm, // ✅ STORE DIRECTLY IN STRUCT

        update: function() {

            var sm = self.sm;        // ✅ ALWAYS SAFE
            var o  = sm.owner;

            var mx = o.input_x;
            var my = o.input_y;

            if (mx != 0 || my != 0) {
                sm.change(Player_Move(sm));
                return;
            }

            if (o.input_attack) {
                sm.change(Player_Attack(sm));
                return;
            }
        }
    };
}



/// =========================
/// PLAYER STATE: MOVE
/// =========================
function Player_Move(_sm) {

    return {

        sm: _sm,

        update: function() {

            var sm = self.sm;
            var o  = sm.owner;

            var tile = tile_get(o.x, o.y);
			

            var speed_factor = 1
			if (tile == TILE.MUD) speed_factor = 0.1;

            if (tile == TILE.HOLE) {
				sm.change(Player_Teleport(sm));
				return;
			}
			
			if (tile == TILE.TRAP) {
				o.hp -= 10;
				o.invincible_timer = 5
				
			}

			var vx = lengthdir_x(o.move_speed * speed_factor, o.move_dir);
			var vy = lengthdir_y(o.move_speed * speed_factor, o.move_dir);
			
			show_debug_message("EMPTY=" + string(TILE.EMPTY)
				+ " WALL=" + string(TILE.WALL)
				+ " WATER=" + string(TILE.WATER)
				+ " MUD=" + string(TILE.MUD)
				+ " TRAP=" + string(TILE.TRAP)
				+ " HOLE=" + string(TILE.HOLE)
				+ " EXPANSION1=" + string(TILE.EXPANSION1)
				+ " EXPANSION2=" + string(TILE.EXPANSION2)
				+ " EXPANSION3=" + string(TILE.EXPANSION3)
				);
			show_debug_message("tile=" + string(tile) + " speed_factor=" + string(speed_factor) + " vx=" + string(vx) + " vy=" + string(vy));

            o.move_and_collide_fn(vx, vy);

            if (o.input_x == 0 && o.input_y == 0) {
                sm.change(Player_Idle(sm));
                return;
            }

            if (o.input_attack) {
                sm.change(Player_Attack(sm));
                return;
            }
        }
    };
}

/// =========================
/// PLAYER STATE: TELEPORT
/// =========================
function Player_Teleport(_sm) {

    return {

        sm: _sm,

        enter: function() {

            var o = self.sm.owner;

            o.teleport_timer = 60;   // total duration (2 phases)
            o.teleport_phase = 0;    // 0 = before, 1 = after
            o.teleport_done = false;
			
			o.flash_timer = 60;
			
			// Particle effect at original position
			spawn_spark(o.x, o.y);
			spawn_spark(o.x, o.y);
			screen_shake(3, 8);

            // Play sound
            audio_play_sound(snd_hole, 1, false);
        },

        update: function() {

            var sm = self.sm;
            var o  = sm.owner;

            o.teleport_timer--;

			switch(o.teleport_phase) {
				/// ==============================
				/// PHASE 0: DISAPPEAR
				/// ==============================
				case 0:
					if (o.teleport_timer <= 0) {
						//Move player
			            o.x = irandom(room_width);
			            o.y = irandom(room_height);					

						// Particle effect at destination
						spawn_spark(o.x, o.y);
						spawn_spark(o.x, o.y);

						// Switch to reappear
						o.teleport_phase = 1;
						o.telport_timer = 60;
						
						o.flash_timer = 60;
					}
				break;

				/// ==============================
				/// PHASE 1: REAPPEAR
				/// ==============================
				case 1:
					if (o.teleport_timer <= 0) {
						sm.change(Player_Idle(sm));
					}
				break;
				

			}
        }
    };
}



/// =========================
/// PLAYER STATE: ATTACK
/// =========================
function Player_Attack(_sm) {

    return {

        sm: _sm,

        enter: function() {

            var sm = self.sm;
            var o  = sm.owner;

            if (o.weapon_cooldown > 0) return;

            weapon_fire(o);
            o.weapon_cooldown = o.weapon.cooldown;
        },

        update: function() {

            var sm = self.sm;

            if (sm.time > 5) {
                sm.change(Player_Idle(sm));
            }
        }
    };
}



/// =========================
/// PLAYER STATE: HIT
/// =========================
function Player_Hit(_sm) {

    return {

        sm: _sm,

        enter: function() {

            var sm = self.sm;
			var o = sm.owner;

            o.hit_timer = 60; // frames of control lock
        },

        update: function() {

            var sm = self.sm;
            var o  = sm.owner;

            o.hit_timer--;

            // Allow knockback but no input
            if (o.hit_timer <= 0) {
                sm.change(Player_Idle(sm));
            }
        }
    };
}