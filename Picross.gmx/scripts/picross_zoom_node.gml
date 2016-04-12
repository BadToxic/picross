/// picross_zoom_node(field_index_x, field_index_y, mouse_index, zoom_factor)
// 
// by BadToxic

var field_index_x, field_index_y, mouse_index, zoom_factor, max_sqrt;

field_index_x = argument0;
field_index_y = argument1;
mouse_index   = argument2;
zoom_factor   = argument3;

max_sqrt = zoom_factor / 2;

var nodes;
nodes[3] = ui_nodes[field_index_y, field_index_x];
nodes[2] = ui_nodes[field_index_y, field_index_x + 1];
nodes[1] = ui_nodes[field_index_y + 1, field_index_x + 1];
nodes[0] = ui_nodes[field_index_y + 1, field_index_x];

// zoom_factor;

for (var node_index = 3; node_index >= 0; node_index--) {
    var n  = nodes[node_index];
    // var nQ = nodes[(node_index + 2) mod 4];
    var dis = point_distance(device_mouse_x(mouse_index), device_mouse_y(mouse_index), n.x_target_start, n.y_target_start);
    // dis = zoom_factor / sqrt(max(max_sqrt, dis));
    dis = zoom_factor * power(1.5, -dis / field_size);
    var dir = point_direction(device_mouse_x(mouse_index), device_mouse_y(mouse_index), n.x_target_start, n.y_target_start);
    n.x_target = n.x_target_start + lengthdir_x(dis, dir);
    n.y_target = n.y_target_start + lengthdir_y(dis, dir);
}
