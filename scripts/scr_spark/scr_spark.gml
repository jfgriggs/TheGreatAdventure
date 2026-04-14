// File: scr_spark.gml

function spawn_spark(_x, _y) {

    if (!instance_exists(obj_controller)) return;

    var ps = obj_controller.ps;
    var pt = obj_controller.pt_spark;

	// Core burst
    part_particles_create(ps, _x, _y, pt, 40);
	
	// Outer burst (slightly offset)
	part_particles_create(ps, _x + random_range(-6,6), _y + random_range(-6, 6), pt, 20);
}