function Weapon_Create(_type) {

    switch(_type) {

        case "slingshot":
            return { name:"Slingshot", cooldown:15, projectile_speed:10, damage:5, type:"single" };

        case "spread":
            return { name:"Spread", cooldown:30, projectile_speed:9, damage:4, spread:15, pellets:3, type:"spread" };

        case "boomerang":
            return { name:"Boomerang", cooldown:40, projectile_speed:8, damage:6, type:"boomerang" };

        case "trap":
            return { name:"Trap", cooldown:50, type:"trap" };

        case "bow":
            return { name:"Bow", cooldown:25, projectile_speed:14, damage:10, type:"charge" };
    }
}