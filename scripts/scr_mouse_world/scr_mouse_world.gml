// File: scr_mouse_world.gml

function mouse_world_x() {
    var cam = view_camera[0];
    return camera_get_view_x(cam) + (window_mouse_get_x() / window_get_width()) * camera_get_view_width(cam);
}

function mouse_world_y() {
    var cam = view_camera[0];
    return camera_get_view_y(cam) + (window_mouse_get_y() / window_get_height()) * camera_get_view_height(cam);
}