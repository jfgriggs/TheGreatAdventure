// =============================================================================
// SCRIPT:      scr_enemy_predator_states
// TYPE:        Predator Enemy State Definitions
// =============================================================================

/// @description Contains predator-specific enemy state constructors and shared predator AI behavior.
///
/// Responsibilities:
/// - Define predator AI states
/// - Handle patrol/chase behavior
/// - Process target acquisition
/// - Handle melee attack behavior
/// - Coordinate movement requests
/// - Process combat-driven transitions
/// - Handle animal/player pursuit behavior
///
/// States:
/// - Predator_Roam
/// - Predator_Hunt
///
/// Notes:
/// - States are struct-based
/// - Transitions use sm.change(NewState(sm))
/// - Shared movement logic belongs in scr_movement
/// - Shared combat logic belongs in scr_combat
/// - Shared AI helpers belong in scr_ai_common
/// - Avoid embedding large subsystem logic directly in states
/// - Keep states focused on orchestration and transitions

function Predator_Roam(_sm) {
    return {
        update: function() {
            var o = _sm.owner;
            var target = instance_nearest(o.x,o.y,obj_animal_sheep);

            if (target != noone) {
                o.target = target;
                _sm.change(Predator_Hunt(_sm));
            }
        }
    };
}

function Predator_Hunt(_sm) {
    return {
        update: function() {
            var o = _sm.owner;
            var t = o.target;

            if (!instance_exists(t)) {
                _sm.change(Predator_Roam(_sm));
                return;
            }

            var dir = point_direction(o.x,o.y,t.x,t.y);

            o.apply_movement(lengthdir_x(o.speed,dir), lengthdir_y(o.speed,dir));

            if (point_distance(o.x,o.y,t.x,t.y) < 20) {
                with(t) instance_destroy();
                _sm.change(Predator_Roam(_sm));
            }
        }
    };
}