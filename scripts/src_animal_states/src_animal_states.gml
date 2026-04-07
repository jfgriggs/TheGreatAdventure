function Animal_Idle(_sm) {
    return {
        enter: function() {
            _sm.owner.dir = irandom(359);
        },

        update: function() {
            var o = _sm.owner;

            move_and_collide(o,
                lengthdir_x(o.speed, o.dir),
                lengthdir_y(o.speed, o.dir)
            );

            var p = obj_player;

            if (instance_exists(p)) {
                if (p.active_item == o.desired_food &&
                    point_distance(o.x,o.y,p.x,p.y) < o.attract_range) {
                    o.target = p;
                    _sm.change(Animal_Follow(_sm));
                }
            }
        }
    };
}

function Animal_Follow(_sm) {
    return {
        update: function() {
            var o = _sm.owner;
            var p = o.target;

            if (!instance_exists(p)) {
                _sm.change(Animal_Idle(_sm));
                return;
            }

            var dir = point_direction(o.x,o.y,p.x,p.y);

            move_and_collide(o,
                lengthdir_x(o.speed, dir),
                lengthdir_y(o.speed, dir)
            );
        }
    };
}