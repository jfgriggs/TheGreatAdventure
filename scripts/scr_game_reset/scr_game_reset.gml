function game_reset() {

    // Reset player
    var p = obj_player;

    if (instance_exists(p)) {
        p.x = p.spawn_x;
		p.y = p.spawn_y;

        p.hp = 100;
        p.is_dead = false;

        p.invincible_timer = 0;

        p.knockback_x = 0;
        p.knockback_y = 0;

        p.trap_timer = 0;
    }

    // Reset enemies (simple version)
    with (obj_enemy_parent) {
        instance_destroy();
    }

    // Reset animals
    with (obj_animal_parent) {
        instance_destroy();
    }

    // (Optional) respawn logic goes here
}