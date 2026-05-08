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
    SPREAD,
    BOOMERANG,
	TRAP,
    BOW
}


function Weapon_Create(_type) {

    switch(_type) {

		case WEAPON.SLINGSHOT:
		    return {
				name: "Slingshot",
				sprite: spr_weapon_slingshot,
				sprite_large: spr_weapon_slingshot_large,
				cooldown:15,
				projectile_speed:10,
				damage:5,
				type:"single"
			};

		case WEAPON.SPREAD:
		    return {
				name: "Spread",
				sprite: spr_weapon_spread,
				sprite_large: spr_weapon_spread_large,
				cooldown: 30,
				projectile_speed: 9,
				damage: 4,
				spread: 15,
				pellets: 3,
				type: "spread"
			};

		case WEAPON.BOOMERANG:
		    return {
				name: "Boomerang",
				sprite: spr_weapon_boomerang,
				sprite_large: spr_weapon_boomerang_large,
				cooldown: 40,
				projectile_speed: 8,
				damage: 6,
				type: "boomerang"
			};

		case WEAPON.TRAP:
		    return {
				name: "Trap",
				sprite: spr_weapon_trap,
				sprite_large: spr_weapon_trap_large,
				cooldown: 50,
				type: "trap"
			};

		case WEAPON.BOW:
		    return {
				name: "Bow",
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

function weapon_fire_single(o, dir) {
    var p = instance_create_layer(o.x, o.y, "Instances", obj_weapon_projectile);
    p.direction = dir;
    p.speed = o.weapon.projectile_speed;
    p.damage = o.weapon.damage;
}

function weapon_fire_spread(o, dir) {
    for (var i = 0; i < o.weapon.pellets; i++) {
        var angle = dir + random_range(-o.weapon.spread, o.weapon.spread);
        var p = instance_create_layer(o.x, o.y, "Instances", obj_weapon_projectile);
        p.direction = angle;
        p.speed = o.weapon.projectile_speed;
        p.damage = o.weapon.damage;
    }
}

function weapon_fire_boomerang(o, dir) {
    var p = instance_create_layer(o.x, o.y, "Instances", obj_weapon_boomerang);
    p.direction = dir;
    p.speed = o.weapon.projectile_speed;
    p.owner = o;
}

function weapon_fire_trap(o, dir) {
    instance_create_layer(o.x, o.y, "Instances", obj_trap);
}

function weapon_fire_bow(o, dir) {
    var p = instance_create_layer(o.x, o.y, "Instances", obj_weapon_projectile);
    p.direction = dir;
    p.speed = o.weapon.projectile_speed;
    p.damage = o.weapon.damage * 2;
}


function Weapon_Fire(o) {

    var dir = point_direction(o.x, o.y, Mouse_GetWorldX(), Mouse_GetWorldY());

    switch(o.weapon.type) {

        case WEAPON.SLINGSHOT:
			weapon_fire_single(o, dir);
			break;
			
        case WEAPON.SPREAD:
			weapon_fire_spread(o, dir);
			break;
			
        case WEAPON.BOOMERANG:
			weapon_fire_boomerang(o, dir);
			break;
        
		case WEAPON.TRAP:
			weapon_fire_trap(o, dir);
			break;
        
		case WEAPON.BOW:
			weapon_fire_bow(o, dir);
			break;
    }
}