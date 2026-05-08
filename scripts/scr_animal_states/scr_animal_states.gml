// =============================================================================
// SCRIPT:      scr_animal_states
// TYPE:        Animal State Definitions
// =============================================================================

/// @description Contains all animal state constructors and shared animal AI state behavior.
///
/// Responsibilities:
/// - Define animal AI states
/// - Handle state transitions
/// - Process wandering behavior
/// - Handle follow targeting
/// - Process eating behavior
/// - Handle safe/pen states
/// - Coordinate movement requests
///
/// States:
/// - AnimalState_Idle
/// - AnimalState_Follow
/// - AnimalState_Eat
/// - AnimalState_Safe
///
/// Notes:
/// - States are struct-based
/// - Transitions use sm.change(NewState(sm))
/// - Shared AI helpers belong in scr_ai_common
/// - Shared movement logic belongs in scr_movement
/// - Avoid embedding species-specific logic directly in states

function Animal_Idle(_sm) {
	return {
		sm: _sm,
		owner: _sm.owner,
        
		enter: function() {
			owner.wander_dir = irandom(359);
        },

        update: function() {
            owner.apply_movement(lengthdir_x(owner.speed, owner.wander_dir), lengthdir_y(owner.speed, owner.wander_dir));

            //var p = obj_player;

            //if (instance_exists(p)) {
            //    if (p.active_item == o.desired_food &&
            //        point_distance(o.x,o.y,p.x,p.y) < o.attract_range) {
            //        o.target = p;
            //        _sm.change(Animal_Follow(_sm));
            //    }
            //}
        }
    };
}

function Animal_Follow(_sm) {
    return {
		sm: _sm,
		owner: _sm.owner,

		update: function() {
            //if (!instance_exists(p)) {
            //    sm.change(o.Animal_Idle());
			//	sm.change(state_idle);
            //    return;
            //}

            //var dir = point_direction(o.x,o.y,p.x,p.y);
            //o.apply_movement(lengthdir_x(o.speed, dir), lengthdir_y(o.speed, dir));
        }
    };
}