// File: scr_animal_states.gml

function Animal_Idle(_sm) {
	return {

		sm: _sm,

        enter: function() {

            var sm = self.sm;
            var o  = sm.owner;
			
			o.wander_dir = irandom(359);
        },

        update: function() {
            var sm = self.sm;
            var o  = sm.owner;

            //o.move_and_collide(
            //    lengthdir_x(o.speed, o.wander_dir),
            //    lengthdir_y(o.speed, o.wander_dir)
            //);

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

        update: function() {
            var sm = self.sm;
            var o  = sm.owner;

            if (!instance_exists(p)) {
                _sm.change(Animal_Idle(_sm));
                return;
            }

            var dir = point_direction(o.x,o.y,p.x,p.y);

            o.move_and_collide_fn(
				lengthdir_x(o.speed, dir),
                lengthdir_y(o.speed, dir)
            );
        }
    };
}