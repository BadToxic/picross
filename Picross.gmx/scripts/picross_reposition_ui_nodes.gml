/// picross_reposition_ui_nodes(game_field)
// Reposition the nodes representing the corners of the fields in the game area.
// So there must be (fields_x + 1) x (fields_y + 1) nodes
// by BadToxic

var game_field, nodes_x, nodes_y, node, xx, yy;

game_field = argument0;

nodes_x = array_length_2d(game_field, 0) + 1;
nodes_y = array_height_2d(game_field) + 1;

xx = game_area_x2;
for (var node_index_x = nodes_x - 1; node_index_x >= 0; node_index_x--) {

    yy = game_area_y2;
    for (var node_index_y = nodes_y - 1; node_index_y >= 0; node_index_y--) {
    
        node = ui_nodes[node_index_y, node_index_x];
         
        node.x_target_start = xx;
        node.y_target_start = yy;
        node.x_target = xx;
        node.y_target = yy;
        node.x = xx;
        node.y = yy;
        
        yy -= field_size;
    }
    xx -= field_size;
}
