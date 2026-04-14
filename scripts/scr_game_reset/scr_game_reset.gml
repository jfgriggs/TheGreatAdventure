// File: src_game_reset.gml

//function game_reset() {

//    global.points = 0;
//    global.animals_saved = 0;
//    global.game_time = 0;

//    room_restart();
//}


function game_reset() {

	// Reset globals
	global.points = 0;
    global.animals_saved = 0;
    global.game_time = 0;

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

    //// Reset enemies (simple version)
    //with (obj_enemy) {
    //    instance_destroy();
    //}

    //// Reset animals
    //with (obj_animal) {
    //    instance_destroy();
    //}

    // (Optional) respawn logic goes here
}