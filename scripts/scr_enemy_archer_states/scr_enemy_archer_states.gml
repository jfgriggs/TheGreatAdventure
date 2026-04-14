// File: scr_enemy_archer_states.gml

function Archer_Patrol(_sm) {
    return {
        enter: function() {
            _sm.owner.wander_dir = irandom(359);
        },

        update: function() {
            var o = _sm.owner;
            var p = obj_player;

            move_and_collide(o,
                lengthdir_x(o.speed,o.wander_dir),
                lengthdir_y(o.speed,o.wander_dir)
            );

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

            move_and_collide(o,
                lengthdir_x(o.speed,dir),
                lengthdir_y(o.speed,dir)
            );

            if (point_distance(o.x,o.y,p.x,p.y) < o.attack_range) {
                _sm.change(Archer_Attack(_sm));
            }
        }
    };
}

function Archer_Attack(_sm) {
    return {
        update: function() {
            var o = _sm.owner;
            var p = obj_player;

            if (_sm.time mod o.fire_rate == 0) {
                var proj = instance_create_layer(o.x,o.y,"Instances",obj_weapon_projectile);
                proj.direction = point_direction(o.x,o.y,p.x,p.y);
            }

            if (point_distance(o.x,o.y,p.x,p.y) > o.attack_range) {
                _sm.change(Archer_Chase(_sm));
            }
        }
    };
}