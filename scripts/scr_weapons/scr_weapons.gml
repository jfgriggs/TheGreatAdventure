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
    BOW
}


function Weapon_Create(_type) {

    switch(_type) {

		case WEAPON.SLINGSHOT:
		    return {
				name: "slingshot",
				sprite: spr_weapon_slingshot,
				sprite_large: spr_weapon_slingshot_large,
				cooldown:15,
				projectile_speed:10,
				damage:5,
				type:"single"
			};

		case WEAPON.SHOTGUN:
		    return {
				name: "shotgun",
				sprite: spr_weapon_shotgun,
				sprite_large: spr_weapon_shotgun_large,
				cooldown: 30,
				projectile_speed: 9,
				damage: 4,
				spread: 15,
				pellets: 3,
				type: "spread"
			};

		case WEAPON.BOOMERANG:
		    return {
				name: "boomerang",
				sprite: spr_weapon_boomerang,
				sprite_large: spr_weapon_boomerang_large,
				cooldown: 40,
				projectile_speed: 8,
				damage: 6,
				type: "boomerang"
			};

		case WEAPON.TRAP:
		    return {
				name: "trap",
				sprite: spr_weapon_trap,
				sprite_large: spr_weapon_trap_large,
				cooldown: 50,
				type: "trap"
			};

		case WEAPON.BOW:
		    return {
				name: "bow",
				sprite: spr_weapon_bow,
				sprite_large: spr_weapon_bow_large,
				cooldown: 25,
				projectile_speed: 14,
				damage: 10,
				type: "charge"
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

function _weapon_fire_single(o, dir) {
	show_debug_message("Weapon_Fire() - " + string(o.active_weapon.name));
	var p = instance_create_layer(o.x, o.y, "Instances", obj_weapon_projectile);
    p.direction = dir;
    p.speed = o.weapon.projectile_speed;
    p.damage = o.weapon.damage;
}

function _weapon_fire_shotgun(o, dir) {
	show_debug_message("Weapon_Fire() - " + string(o.active_weapon.name));
    for (var i = 0; i < o.active_weapon.pellets; i++) {
        var angle = dir + random_range(-o.active_weapon.spread, o.active_weapon.spread);
        var p = instance_create_layer(o.x, o.y, "Instances", obj_weapon_projectile);
        p.direction = angle;
        p.speed = o.active_weapon.projectile_speed;
        p.damage = o.active_weapon.damage;
    }
}

function _weapon_fire_boomerang(o, dir) {
	show_debug_message("Weapon_Fire() - " + string(o.active_weapon.name));
    var p = instance_create_layer(o.x, o.y, "Instances", obj_weapon_boomerang);
    p.direction = dir;
    p.speed = o.active_weapon.projectile_speed;
    p.owner = o;
}

function _weapon_fire_trap(o, dir) {
	show_debug_message("Weapon_Fire() - " + string(o.active_weapon.name));
    instance_create_layer(o.x, o.y, "Instances", obj_trap);
}

function _weapon_fire_bow(o, dir) {
	show_debug_message("Weapon_Fire() - " + string(o.active_weapon.name));
    var p = instance_create_layer(o.x, o.y, "Instances", obj_weapon_projectile);
    p.direction = dir;
    p.speed = o.active_weapon.projectile_speed;
    p.damage = o.active_weapon.damage * 2;
}


function Weapon_Fire(_o) {
    var o = _o;

    if (!instance_exists(o)) return;
    if (ds_list_size(o.weapons) <= 0) return;
    if (o.active_weapon == undefined) return;
	
    var dir = point_direction(o.x, o.y, Mouse_GetWorldX(), Mouse_GetWorldY());

    switch(o.active_weapon.type) {

        case WEAPON.SLINGSHOT:
			_weapon_fire_single(o, dir);
			break;
			
        case WEAPON.SHOTGUN:
			_weapon_fire_shotgun(o, dir);
			break;
			
        case WEAPON.BOOMERANG:
			_weapon_fire_boomerang(o, dir);
			break;
        
		case WEAPON.TRAP:
			_weapon_fire_trap(o, dir);
			break;
        
		case WEAPON.BOW:
			_weapon_fire_bow(o, dir);
			break;
    }
}