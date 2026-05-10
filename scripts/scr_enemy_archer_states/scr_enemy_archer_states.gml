// =============================================================================
// SCRIPT:      scr_enemy_archer_states
// TYPE:        Archer Enemy State Definitions
// =============================================================================

/// @description Contains archer-specific enemy state constructors and shared ranged combat AI behavior.
///
/// Responsibilities:
/// - Define archer AI states
/// - Handle patrol/chase behavior
/// - Process target acquisition
/// - Handle ranged attack behavior
/// - Coordinate projectile attacks
/// - Process combat-driven transitions
/// - Coordinate movement requests
///
/// States:
/// - Archer_Patrol
/// - Archer_Chase
/// - Archer_Shoot
///
/// Notes:
/// - States are struct-based
/// - Transitions use sm.change(NewState(sm))
/// - Shared movement logic belongs in scr_movement
/// - Shared combat logic belongs in scr_combat
/// - Shared AI helpers belong in scr_ai_common
/// - Projectile spawning should remain centralized
/// - Avoid embedding large subsystem logic directly in states
/// - Keep states focused on orchestration and transitions

function Archer_Patrol(_sm) {
    return {
        enter: function() {
            _sm.owner.wander_dir = irandom(359);
        },

        update: function() {
            var o = _sm.owner;
            var p = obj_player;

            o.apply_movement(lengthdir_x(o.speed,o.wander_dir), lengthdir_y(o.speed,o.wander_dir));

            if (point_distance(o.x,o.y,p.x,p.y) < o.vision_range) {
                _sm.change(Archer_Chase(_sm));
            }
        }
    };
}

function Archer_Chase(_sm) {
    return {
        update: function() {
            var o = _sm.owner;
            var p = obj_player;

            var dir = point_direction(o.x,o.y,p.x,p.y);

            o.apply_movement(lengthdir_x(o.speed,dir), lengthdir_y(o.speed,dir));

            if (point_distance(o.x,o.y,p.x,p.y) < o.attack_range) {
                _sm.change(Archer_Attack(_sm));
            }
        }
    };
}

function Archer_Shoot(_sm) {
    return {
        update: function() {
            var o = _sm.owner;
            var p = obj_player;

            if (_sm.time mod o.fire_rate == 0) {
                var proj = instance_create_layer(o.x,o.y,"Instances",obj_projectile_pellets);
                proj.direction = point_direction(o.x,o.y,p.x,p.y);
            }

            if (point_distance(o.x,o.y,p.x,p.y) > o.attack_range) {
                _sm.change(Archer_Chase(_sm));
            }
        }
    };
}