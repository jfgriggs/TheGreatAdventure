function mouse_world_x() {
    return camera_get_view_x(view_camera[0]) + device_mouse_x(0);
}

function mouse_world_y() {
    return camera_get_view_y(view_camera[0]) + device_mouse_y(0);
}