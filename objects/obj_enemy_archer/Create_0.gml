sm = new StateMachine(id);

speed = 2;

vision_range = 300;
attack_range = 200;
fire_rate = 30;

// Health
hp = 20;
iframes = 10;
invincible_timer = 0;

knockback_x = 0;
knockback_y = 0;
knockback_force = 4;

sm.change(Archer_Patrol(sm));