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
/// - Player_Idle
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
		on_update: function() {
			var mx = owner.input_x;
			var my = owner.input_y;

			if (mx != 0 || my != 0) {
				sm.change(Player_Move(sm));
				return;
			}

			if (owner.input_attack) {
				show_debug_message("Player changing to ATTACK state");
				sm.change(Player_Attack(sm));
				return;
			}

			if (owner.input_throw && ds_map_size(owner.inventory) > 0) {
				show_debug_message("Player changing to THROW state");
				sm.change(Player_Throw(sm));
				return;
			}
		},
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
		on_enter: function() {},
		on_update: function() {
			if (!owner.control_locked) {
				var tile = Tile_Get(owner.x, owner.y);

				if (tile == TILE.HOLE) {
					sm.change(Player_Teleport(sm));
					return;
				}

				if (tile == TILE.TRAP) {
					owner.hp -= 10;
					owner.invincible_timer = 5;
				}
			}

			if (owner.input_x == 0 && owner.input_y == 0) {
				sm.change(Player_Idle(sm));
				return;
			}

			if (owner.input_attack) {
				sm.change(Player_Attack(sm));
				return;
			}

			if (owner.input_throw && ds_map_size(owner.inventory) > 0) {
				sm.change(Player_Throw(sm));
				return;
			}
		},
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
		on_enter: function() {
			owner.teleport_timer = Seconds(1);
			owner.teleport_phase = 0;

			owner.control_locked = true;

			owner.velocity_x = 0;
			owner.velocity_y = 0;

			owner.flash_timer = Seconds(1);

			Spark_Spawn(owner.x, owner.y);
			Spark_Spawn(owner.x, owner.y);

			Screen_Shake(3, 8);

			audio_play_sound(snd_hole, 1, false);

			show_debug_message("Teleport timer = " + string(owner.teleport_timer));
		},
		on_update: function() {
			owner.teleport_timer--;
			show_debug_message("Teleport timer = " + string(owner.teleport_timer));

			switch (owner.teleport_phase) {
				/// ==============================
				/// PHASE 0: DISAPPEAR
				/// ==============================
				case 0:
					if (owner.teleport_timer <= 0) {
						show_debug_message("Teleporting...");

						//Move player - find a position that is not blocked by a wall, water, or trap.
						var attempts = 50;

						var teleported = false;

						repeat (attempts) {
							var tx = irandom(room_width div global.tile_size) * global.tile_size;
							var ty = irandom(room_height div global.tile_size) * global.tile_size;

							var tile = Tile_Get(tx, ty);
							show_debug_message("Teleport tile: " + string(tile));

							if (Tile_Is_Player_Safe(tile)) {
								owner.x = tx;
								owner.y = ty;

								// Particle effect at destination
								Spark_Spawn(owner.x, owner.y);
								Spark_Spawn(owner.x, owner.y);

								// Switch to reappear
								owner.teleport_phase = 1;
								owner.teleport_timer = Seconds(1);
								owner.flash_timer = Seconds(1);

								teleported = true;

								break;
							}
						}

						if (!teleported) {
							show_debug_message("Teleport failed: no safe tile found");

							owner.control_locked = false;

							sm.change(Player_Idle(sm));
						}
					}
					break;

				/// ==============================
				/// PHASE 1: REAPPEAR
				/// ==============================
				case 1:
					if (owner.teleport_timer <= 0) {
						show_debug_message("Teleportation complete");
						owner.control_locked = false;
						sm.change(Player_Idle(sm));
					}
					break;
			}
		},
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
		on_enter: function() {
			//show_debug_message("Player entered ATTACK state - enter() - sm_exists=" + string(!is_undefined(sm))
			//	+ ", weapon=" + string(owner.active_weapon.name)
			//	+ ", cooldown=" + string(owner.active_weapon_cooldown)
			//	);

			// If no weapons the cannot fire then reset cooldown
			if (ds_list_size(owner.weapons) == 0) {
				owner.active_weapon_cooldown = 0;
				return;
			}

			if (owner.active_weapon_cooldown > 0) {
				return;
			}

			// Fire weapon
			Weapon_Fire(owner);

			// Small cooldown period to reload
			owner.active_weapon_cooldown = owner.active_weapon.cooldown;
		},
		on_update: function() {
			//show_debug_message("Player entered ATTACK state - update() - sm_exists=" + string(!is_undefined(sm))
			//	+ ", weapon=" + string(owner.active_weapon.name)
			//	+ ", cooldown=" + string(owner.active_weapon_cooldown)
			//	);

			// Cooldown continues independently
			if (owner.active_weapon_cooldown > 0) {
				owner.active_weapon_cooldown--;
			}

			// Immediately return to movement orchestration
			if (owner.input_x != 0 || owner.input_y != 0) {
				sm.change(Player_Move(sm));
			} else {
				sm.change(Player_Idle(sm));
			}
		},
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
		on_enter: function() {
			//if (owner.active_item == undefined) return;
			//show_debug_message("Player entered THROW state - enter() - sm_exists=" + string(!is_undefined(sm))
			//	+ ", item=" + string(owner.active_item.name)
			//	+ ", throw_timer=" + string(owner.throw_timer)
			//	);

			// Perform throw
			Item_Throw(owner);

			// Small delay so it feels intentional
			owner.throw_timer = 8;
		},
		on_update: function() {
			//if (owner.active_item == undefined) {
			//	sm.change(Player_Idle(sm));
			//	return;
			//}
			//show_debug_message("Player entered THROW state - update() - sm_exists=" + string(!is_undefined(sm))
			//	+ ", item=" + string(owner.active_item.name)
			//	+ ", throw_timer=" + string(owner.throw_timer)
			//	);

			owner.throw_timer--;

			if (owner.throw_timer <= 0) {
				sm.change(Player_Idle(sm));
			}
		},
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
		on_enter: function() {
			owner.hit_timer = 60; // frames of control lock
		},
		on_update: function() {
			owner.hit_timer--;

			// Allow knockback but no input
			if (owner.hit_timer <= 0) {
				sm.change(Player_Idle(sm));
			}
		},
	};
}
