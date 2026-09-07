// ===========================================================================
// OBJECT:       obj_enemy
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Enemy Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Initializes shared enemy health, damage response, target and movement fields, and enemy runtime state.
//
// ===========================================================================

event_inherited();

/// =========================================================
/// IDENTITY
/// =========================================================

enemy_type = ENEMY.NONE;

faction = FACTION.ENEMY;

/// =========================================================
/// RUNTIME
/// =========================================================

is_dead = false;

target = noone;

/// =========================================================
/// HEALTH
/// =========================================================

hp_max = 10;
hp = hp_max;

/// =========================================================
/// MOVEMENT
/// =========================================================

vx = 0;
vy = 0;

move_speed = 1.0;

face = 3;

/// =========================================================
/// VISION
/// =========================================================

vision_range = 256;
lose_range = 320;
lose_time_max = Seconds(3);

lose_timer = 0;

/// =========================================================
/// COMBAT
/// =========================================================

attack_range = 24;

attack_damage = 1;

attack_rate = Seconds(1);
attack_timer = 0;

uses_projectiles = false;
projectile_object = noone;

/// =========================================================
/// LOOT
/// =========================================================

can_pickup_treasure = false;

inventory = undefined;

/// =========================================================
/// WANDERING
/// =========================================================

wander_state = "idle";

wander_dir = 0;
wander_timer = 0;

wander_speed = 0.7;

wander_move_time_min = 20;
wander_move_time_max = 60;

wander_idle_time_min = 15;
wander_idle_time_max = 45;

/// =========================================================
/// VISUALS
/// =========================================================

sprite_set = [];

flash_timer = 0;
flash_time = 4;

/// =========================================================
/// STATE MACHINE
/// =========================================================

sm = new StateMachine(self);

sm.change(Enemy_Hunt(sm));

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
