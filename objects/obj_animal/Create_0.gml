sm = new StateMachine(id);

speed = 2;

desired_food = "carrot";

attract_range = 200;
lose_range = 300;

target = noone;

sm.change(Animal_Idle(sm));