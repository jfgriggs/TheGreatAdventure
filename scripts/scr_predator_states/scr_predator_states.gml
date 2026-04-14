// File: scr_predator_states.gml

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

            move_and_collide(o,
                lengthdir_x(o.speed,dir),
                lengthdir_y(o.speed,dir)
            );

            if (point_distance(o.x,o.y,t.x,t.y) < 20) {
                with(t) instance_destroy();
                _sm.change(Predator_Roam(_sm));
            }
        }
    };
}