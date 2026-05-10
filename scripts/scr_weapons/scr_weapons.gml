// =============================================================================
// SCRIPT:      scr_weapons
// TYPE:        Weapon Subsystem
// =============================================================================

/// @description Centralized weapon handling and combat utility system.
///
/// Responsibilities:
/// - Weapon creation/configuration
/// - Weapon firing behavior
/// - Ammo/resource handling
/// - Damage configuration
/// - Projectile spawning
/// - Weapon cooldown management
/// - Shared combat helpers
///
/// Public API:
/// - Weapon_Create()
/// - Weapon_Fire()
///
/// Notes:
/// - Weapon definitions should remain data-driven
/// - Shared combat logic belongs in scr_combat
/// - Projectile movement should remain centralized
/// - Avoid duplicating weapon logic across objects
/// - Supports player and enemy weapon systems

enum WEAPON {
	SLINGSHOT,
    SHOTGUN,
    BOOMERANG,
	TRAP,
    BOW,
	MAGIC_STAFF
}

enum PROJECTILE_MOTION {
    STRAIGHT,
    SINE
}

function Weapon_Create(_type) {

    switch(_type) {

		case WEAPON.SLINGSHOT:
		    return {
				name: "slingshot",
				weapon_id: WEAPON.SLINGSHOT,
				sprite: spr_weapon_slingshot,
				sprite_large: spr_weapon_slingshot_large,
				cooldown: 15,
				projectile_speed: 10,
				max_distance: 125,
				drag: 0.96,
				damage: 5
			};

		case WEAPON.SHOTGUN:
		    return {
				name: "shotgun",
				weapon_id: WEAPON.SHOTGUN,
				sprite: spr_weapon_shotgun,
				sprite_large: spr_weapon_shotgun_large,
				cooldown: 30,
				projectile_speed: 2,
				max_distance: 100,
				damage: 4,
				spread: 15,
				pellets: 10
			};

		case WEAPON.BOOMERANG:
		    return {
				name: "boomerang",
				weapon_id: WEAPON.BOOMERANG,
				sprite: spr_weapon_boomerang,
				sprite_large: spr_weapon_boomerang_large,
				cooldown: 40,
				projectile_speed: 1.5,
				max_distance: 150,
				drag: 0.96,
				damage: 6
			};

		case WEAPON.TRAP:
		    return {
				name: "trap",
				weapon_id: WEAPON.TRAP,
				sprite: spr_weapon_trap,
				sprite_large: spr_weapon_trap_large,
				cooldown: 50,
				max_distance: 5,
				damage: 10
			};

		case WEAPON.BOW:
		    return {
				name: "bow",
				weapon_id: WEAPON.BOW,
				sprite: spr_weapon_bow,
				sprite_large: spr_weapon_bow_large,
				cooldown: 25,
				projectile_speed: 2,
				max_distance: 200,
				drag: 0.96,
				damage: 10
			};
			
		case WEAPON.MAGIC_STAFF:
		    return {
		        name: "magic staff",
		        weapon_id: WEAPON.MAGIC_STAFF,
		        sprite: spr_weapon_magic_staff,
		        sprite_large: spr_weapon_magic_staff_large,
		        cooldown: 18,
		        projectile_speed: 6,
		        damage: 2,
		        pellets: 8,
		        spread: 20,
		        max_distance: 150,
		        projectile_motion: PROJECTILE_MOTION.SINE,
		        wave_amplitude: 12,
		        wave_frequency: 0.18
		    };
	}
	return {
		name: "Forgot to add new weapon to scr_weapons",
		sprite: spr_weapon_slingshot,
		sprite_large: spr_weapon_slingshot_large,
		cooldown:15,
		projectile_speed:10,
		damage:5,
		type:"single"
	};
}


function Weapon_Fire(_o) {
    var o = _o;

    if (!instance_exists(o)) return;
    if (ds_list_size(o.weapons) <= 0) return;
    if (o.active_weapon == undefined) return;
	
    var dir = point_direction(o.x, o.y, Mouse_GetWorldX(), Mouse_GetWorldY());
	var spawn_x = o.get_projectile_spawn_x(dir);
	var spawn_y = o.get_projectile_spawn_y(dir);

	show_debug_message("Weapon_Fire() - " + string(o.active_weapon.name));
			
    switch(o.active_weapon.weapon_id) {

        case WEAPON.SLINGSHOT:
			var p = instance_create_layer(spawn_x, spawn_y, "Instances", obj_projectile_slug);
		    p.direction = dir;
		    p.speed = o.active_weapon.projectile_speed;
		    p.damage = o.active_weapon.damage;
			p.max_distance = o.active_weapon.max_distance;
			break;
			
        case WEAPON.SHOTGUN:
		    //for (var i = 0; i < o.active_weapon.pellets; i++) {
		    //    var angle = dir + random_range(-o.active_weapon.spread, o.active_weapon.spread);
		    //    var p = instance_create_layer(spawn_x, spawn_y, "Instances", obj_projectile);
		    //    p.direction = angle;
		    //    p.speed = o.active_weapon.projectile_speed;
		    //    p.damage = o.active_weapon.damage;
			//	p.max_distance = o.active_weapon.max_distance;
		    //}

			/// =========================
			/// SHOTGUN PELLETS
			/// =========================

			// Total spread angle
			var spread = o.active_weapon.spread;
			var pellets = o.active_weapon.pellets;

			// -------------------------------------------------------------------------
			// Calculate interval spacing
			// -------------------------------------------------------------------------
			var interval = 0;
			if (pellets > 1) {
			    interval = spread / (pellets - 1);
			}

			var start_angle = dir - (spread * 0.5);

			// -------------------------------------------------------------------------
			// Spawn pellets
			// -------------------------------------------------------------------------
			for (var i = 0; i < pellets; i++) {
			    var angle = start_angle + (interval * i);
			    var p = instance_create_layer(spawn_x, spawn_y, "Instances", obj_projectile_pellets);

				// -------------------------------------------------------------
			    // Slight velocity variation
			    // -------------------------------------------------------------
			    var speed_variance = random_range(0.90, 1.10);
				var pellet_speed = o.active_weapon.projectile_speed * speed_variance;

				p.direction = angle;
			    p.speed = pellet_speed;
			    p.damage = o.active_weapon.damage;
			    p.max_distance = o.active_weapon.max_distance;
			}
			break;
			
        case WEAPON.BOOMERANG:
		    var p = instance_create_layer(spawn_x, spawn_y, "Instances", obj_projectile_boomerang);
			p.target_x = Mouse_GetWorldX();
			p.target_y = Mouse_GetWorldY();
			p.owner = o;
			break;
        
		case WEAPON.TRAP:
			instance_create_layer(spawn_x, spawn_y, "Instances", obj_trap);
			break;
        
		case WEAPON.BOW:
		    var p = instance_create_layer(spawn_x, spawn_y, "Instances", obj_projectile_arrow);
		    p.direction = dir;
		    p.speed = o.active_weapon.projectile_speed;
		    p.damage = o.active_weapon.damage * 2;
			p.max_distance = o.active_weapon.max_distance;
			break;
			
        case WEAPON.MAGIC_STAFF:
			/// =========================
			/// MAGIC DUST
			/// =========================

			// Total spread angle
			var spread = o.active_weapon.spread;
			var pellets = o.active_weapon.pellets;

			// -------------------------------------------------------------------------
			// Calculate interval spacing
			// -------------------------------------------------------------------------
			var interval = 0;
			if (pellets > 1) {
			    interval = spread / (pellets - 1);
			}

			var start_angle = dir - (spread * 0.5);

			// -------------------------------------------------------------------------
			// Spawn pellets
			// -------------------------------------------------------------------------
			for (var i = 0; i < pellets; i++) {
			    var angle = start_angle + (interval * i);
			    var p = instance_create_layer(spawn_x, spawn_y, "Instances", obj_projectile_magic);

				// -------------------------------------------------------------
			    // Slight velocity variation
			    // -------------------------------------------------------------
			    var speed_variance = random_range(0.90, 1.10);
				var pellet_speed = o.active_weapon.projectile_speed * speed_variance;

				p.direction = angle;
				p.travel_dir = angle;
			    p.speed = pellet_speed;
			    p.damage = o.active_weapon.damage;
			    p.max_distance = o.active_weapon.max_distance;
			}
			break;
    }
}