sm = new StateMachine(id);

speed = 3;

hp = 30;
iframes = 10;
invincible_timer = 0;

knockback_x = 0;
knockback_y = 0;
knockback_force = 5;

sm.change(Predator_Roam(sm));