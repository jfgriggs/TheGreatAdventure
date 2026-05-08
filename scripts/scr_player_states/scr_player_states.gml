// =============================================================================
// SCRIPT:      scr_player_states
// TYPE:        Player State Definitions
// =============================================================================

/// @description Contains all player state constructors and shared player state behavior.
///
/// Responsibilities:
/// - Define player state logic
/// - Handle state transitions
/// - Process movement state behavior
/// - Handle attack/throw behavior
/// - Coordinate animation state updates
/// - Process input-driven state changes
/// - Coordinate movement/combat requests
///
/// States:
/// - Playey_Idle
/// - Player_Move
/// - Player_Throw
/// - Player_Attack
///
/// Notes:
/// - States are struct-based
/// - Transitions use sm.change(NewState(sm))
/// - Shared movement logic belongs in scr_movement
/// - Shared combat logic belongs in scr_combat
/// - Avoid embedding large subsystem logic directly in states
/// - Keep states focused on orchestration and transitions

/// =========================
/// PLAYER STATE: IDLE
function Player_Idle(_sm) {

    return {
        name: "idle",

		sm: _sm,
		owner: _sm.owner,

		update: function() {

            var mx = owner.input_x;
            var my = owner.input_y;

            if (mx != 0 || my != 0) {
                sm.change(Player_Move(sm));
                return;
            }

            if (owner.input_attack) {
                sm.change(Player_Attack(sm));
                return;
            }

			if (owner.input_throw) {
				show_debug_message("Player entered THROW state");
				show_debug_message("sm exists=" + string(!is_undefined(sm)));
			    sm.change(Player_Throw(sm));
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
        name: "move",
		
		sm: _sm,
		owner: _sm.owner,

        enter: function() {},
		
        update: function() {
            var tile = Tile_Get(owner.x, owner.y);

            var speed_factor = 1
			if (tile == TILE.MUD) speed_factor = 0.1;

            if (tile == TILE.HOLE) {
				sm.change(Player_Teleport(sm));
				return;
			}
			
			if (tile == TILE.TRAP) {
				owner.hp -= 10;
				owner.invincible_timer = 5
			}

			var vx = lengthdir_x(owner.move_speed * speed_factor, owner.move_dir);
			var vy = lengthdir_y(owner.move_speed * speed_factor, owner.move_dir);
			
			//show_debug_message("EMPTY=" + string(TILE.EMPTY)
			//	+ " WALL=" + string(TILE.WALL)
			//	+ " WATER=" + string(TILE.WATER)
			//	+ " MUD=" + string(TILE.MUD)
			//	+ " TRAP=" + string(TILE.TRAP)
			//	+ " HOLE=" + string(TILE.HOLE)
			//	+ " EXPANSION1=" + string(TILE.EXPANSION1)
			//	+ " EXPANSION2=" + string(TILE.EXPANSION2)
			//	+ " EXPANSION3=" + string(TILE.EXPANSION3)
			//	);
			//show_debug_message("tile=" + string(tile) + " speed_factor=" + string(speed_factor) + " vx=" + string(vx) + " vy=" + string(vy));

			show_debug_message(instance_exists(owner));
            owner.apply_movement(vx, vy);

            if (owner.input_x == 0 && owner.input_y == 0) {
                sm.change(Player_Idle(sm));
                return;
            }

            if (owner.input_attack) {
                sm.change(Player_Attack(sm));
                return;
            }
						
			if (owner.input_throw) {
			    sm.change(Player_Throw(sm));
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
        name: "teleport",

		sm: _sm,
		owner: _sm.owner,

        enter: function() {
            owner.teleport_timer = 60;   // total duration (2 phases)
            owner.teleport_phase = 0;    // 0 = before, 1 = after
            owner.teleport_done = false;
			
			owner.flash_timer = 60;
			
			// Particle effect at original position
			Spark_Spawn(owner.x, owner.y);
			Spark_Spawn(owner.x, owner.y);
			Screen_Shake(3, 8);

            // Play sound
            audio_play_sound(snd_hole, 1, false);
        },

        update: function() {
            owner.teleport_timer--;

			switch(owner.teleport_phase) {
				/// ==============================
				/// PHASE 0: DISAPPEAR
				/// ==============================
				case 0:
					if (owner.teleport_timer <= 0) {
						//Move player - find a position that is not blocked by a wall, water, or trap.
					    var tile_size = 16; // match your tileset
					    var attempts = 50;

					    repeat (attempts) {

					        var tx = irandom(room_width div tile_size) * tile_size;
					        var ty = irandom(room_height div tile_size) * tile_size;

					        var tile = Tile_Get(tx, ty);

					        if (!Tile_Is_Blocking(tile)) {
					            owner.x = tx;
								owner.y = ty;
							
								// Particle effect at destination
								Spark_Spawn(owner.x, owner.y);
								Spark_Spawn(owner.x, owner.y);

								// Switch to reappear
								owner.teleport_phase = 1;
								owner.telport_timer = 60;
								owner.flash_timer = 60;								
								
								break;
					        }
						}
					}
				break;

				/// ==============================
				/// PHASE 1: REAPPEAR
				/// ==============================
				case 1:
					if (owner.teleport_timer <= 0) {
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
        name: "attack",

		sm: _sm,
		owner: _sm.owner,

        enter: function() {
			show_debug_message("Player entered ATTACK state - enter() - sm_exists=" + string(!is_undefined(sm))
				+ ", weapon=" + string(owner.active_weapon.name)
				+ ", cooldown=" + string(owner.active_weapon_cooldown)
				);
			
            // Prevent firing if no weapons
            if (ds_list_size(owner.weapons) <= 0) {
                sm.change(Player_Idle(sm));
                return;
            }

			if (owner.active_weapon_cooldown > 0) return;

			// Fire weapon
            Weapon_Fire(owner);
			
			// Small cooldown period to reload
            owner.active_weapon_cooldown = owner.active_weapon.cooldown;
        },

		update: function() {
			show_debug_message("Player entered ATTACK state - update() - sm_exists=" + string(!is_undefined(sm))
				+ ", weapon=" + string(owner.active_weapon.name)
				+ ", cooldown=" + string(owner.active_weapon_cooldown)
				);

            owner.active_weapon_cooldown--;

            if (owner.active_weapon_cooldown <= 0) {
                sm.change(Player_Idle(sm));
            }

		}
    };
}


/// =========================
/// PLAYER STATE: THROW
/// =========================
function Player_Throw(_sm) {
    return {
        name: "throw",

		sm: _sm,
		owner: _sm.owner,

        enter: function() {
			show_debug_message("Player entered THROW state - enter() - sm_exists=" + string(!is_undefined(sm))
				+ ", item=" + string(owner.active_item.name)
				+ ", throw_timer=" + string(owner.throw_timer)
				);

            // Prevent throwing if no items
            if (ds_list_size(owner.inventory) <= 0) {
                sm.change(Player_Idle(sm));
                return;
            }
			
            // Perform throw
            Item_Throw(owner);

            // Small delay so it feels intentional
            owner.throw_timer = 8;
        },
		
        update: function() {
			show_debug_message("Player entered THROW state - update() - sm_exists=" + string(!is_undefined(sm))
				+ ", item=" + string(owner.active_item.name)
				+ ", throw_timer=" + string(owner.throw_timer)
				);

            owner.throw_timer--;

            if (owner.throw_timer <= 0) {
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
        name: "hit",

		sm: _sm,
		owner: _sm.owner,

        enter: function() {
            owner.hit_timer = 60; // frames of control lock
        },

        update: function() {
            owner.hit_timer--;

            // Allow knockback but no input
            if (owner.hit_timer <= 0) {
                sm.change(Player_Idle(sm));
            }
        }
    };
}