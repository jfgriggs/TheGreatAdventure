if (obj_controller.game_state != GAME_STATE.PLAYING) exit;

sm.update();

// Check if in pen
var pen = instance_place(x, y, obj_pen);

if (pen != noone) {
    pen.add_animal();
    instance_destroy();
}