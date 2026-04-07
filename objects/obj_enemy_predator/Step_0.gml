if (obj_controller.game_state != GAME_STATE.PLAYING) exit;

sm.update();

if (invincible_timer > 0) invincible_timer--;

if (abs(knockback_x) > 0.1 || abs(knockback_y) > 0.1) {
    move_and_collide(id, knockback_x, knockback_y);
    knockback_x *= 0.8;
    knockback_y *= 0.8;
}