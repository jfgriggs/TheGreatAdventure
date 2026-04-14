// File: src_throw_item.gml

function throw_item(_o) {

    var o = _o;

    if (!instance_exists(o)) return;
	//if (!variable_instance_exists(id, "start_x")) return;
	
    if (ds_list_size(o.inventory) <= 0) return;

    var item = o.inventory[| o.active_item_index];
    if (item == undefined) return;


    /// =========================
    /// CREATE OBJECT (SAFE)
    /// =========================
//    var obj = asset_get_index("obj_item_thrown");
//	show_debug_message(string(obj));

    var t = instance_create_layer(o.x, o.y, "Instances", obj_item_thrown);

    t.item = item;
    t.sprite_index = item.sprite;
	t.max_distance = item.throw_distance
	t.drag = item.drag;
	t.start_x = o.x;
	t.start_y = o.y;

    /// =========================
    /// AIM
    /// =========================
    var mx = mouse_world_x();
    var my = mouse_world_y();

    var dir = point_direction(o.x, o.y, mx, my);


    /// =========================
    /// VELOCITY
    /// =========================
    var ispeed = item.throw_speed;

    t.vx = lengthdir_x(ispeed, dir);
    t.vy = lengthdir_y(ispeed, dir);

    t.image_angle = dir;


    /// =========================
    /// REMOVE ITEM
    /// =========================
    item.count--;

    if (item.count <= 0) {

        ds_list_delete(o.inventory, o.active_item_index);

        if (ds_list_size(o.inventory) > 0) {
            o.active_item_index = clamp(o.active_item_index, 0, ds_list_size(o.inventory) - 1);
        } else {
            o.active_item_index = 0;
        }
    }
}