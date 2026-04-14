// File: scr_weapons.gml

function Weapon_Create(_type) {

    switch(_type) {

        case "slingshot":
            return { name:"Slingshot", sprite:spr_weapon_slingshot, sprite_large:spr_weapon_slingshot_large, cooldown:15, projectile_speed:10, damage:5, type:"single" };

        case "spread":
            return { name:"Spread", sprite:spr_weapon_spread, sprite_large:spr_weapon_spread_large, cooldown:30, projectile_speed:9, damage:4, spread:15, pellets:3, type:"spread" };

        case "boomerang":
            return { name:"Boomerang", sprite:spr_weapon_boomerang, sprite_large:spr_weapon_boomerang_large, cooldown:40, projectile_speed:8, damage:6, type:"boomerang" };

        case "trap":
            return { name:"Trap", sprite:spr_weapon_trap, sprite_large:spr_weapon_trap_large, cooldown:50, type:"trap" };

        case "bow":
            return { name:"Bow", sprite:spr_weapon_bow, sprite_large:spr_weapon_bow_large, cooldown:25, projectile_speed:14, damage:10, type:"charge" };
    }
}