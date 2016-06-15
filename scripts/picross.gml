#define picross_create_empty_game_field
/// picross_create_empty_game_field(fields_x, fields_y)
// Generates an empty game area filled with zeros.
// by BadToxic

var fields_x, fields_y, empty_game_field;

fields_x = argument0;
fields_y = argument1;

for (var field_index_x = fields_x - 1; field_index_x >= 0; field_index_x--) {
    for (var field_index_y = fields_y - 1; field_index_y >= 0; field_index_y--) {
    
        empty_game_field[field_index_y, field_index_x] = 0;
        
    }
}

return empty_game_field;

#define picross_generate_random_pattern
/// picross_generate_random_pattern(fields_x, fields_y)
// Generates a random pattern.
// by BadToxic

var fields_x, fields_y, random_pattern;

fields_x = argument0;
fields_y = argument1;

for (var field_index_x = fields_x - 1; field_index_x >= 0; field_index_x--) {
    for (var field_index_y = fields_y - 1; field_index_y >= 0; field_index_y--) {
    
        random_pattern[field_index_y, field_index_x] = irandom(1);
        
    }
}

return random_pattern;

#define picross_count_marks
/// picross_count_marks(game_field)
// Counts all set marks in a pattern
// by BadToxic

var fields_x, fields_y, game_field, mark_number;

game_field = argument0;

fields_x = array_length_2d(game_field, 0);
fields_y = array_height_2d(game_field);

mark_number = 0;

for (var field_index_x = fields_x - 1; field_index_x >= 0; field_index_x--) {
    for (var field_index_y = fields_y - 1; field_index_y >= 0; field_index_y--) {
    
        if (game_field[field_index_y, field_index_x] == 1) {
            mark_number++;
        }
        
    }
}

return mark_number;

#define picross_check_if_solved
/// picross_check_if_solved()
// Returns true if game_field is solved, else false.
// Accepts multiple solutions.
// by BadToxic

var fields_x, fields_y;

if (game_field_marks != solution_marks) {
    return false; // Has to have the same number of marks
}

fields_x = array_length_2d(game_field, 0);
fields_y = array_height_2d(game_field);

if (fields_x != array_length_2d(solution, 0) || fields_y != array_height_2d(solution)) {
    return false; // Dimension missmatch
}

var count, list, index;

// Compare numbers for colums
for (var field_index_x = fields_x - 1; field_index_x >= 0; field_index_x--) {

    count = 0;
    list = column_numbers[field_index_x];
    index = ds_list_size(list) - 1;
    
    for (var field_index_y = fields_y - 1; field_index_y >= 0; field_index_y--) {
        
        // column_numbers
        if (game_field[field_index_y, field_index_x] == 1) {
            count++;
        }
        
        // Chain ended or border reached
        if (game_field[field_index_y, field_index_x] != 1 || field_index_y == 0) {
            if (count > 0) { // Check the number
                if (count != list[|index]) {
                    show_message("colums count != list[|index] - count=" + string(count) + ", index=" + string(index) + ", list[|index]=" + string(list[|index]) + ", field_index_x=" + string(field_index_x) + ", field_index_y=" + string(field_index_y));
                    return false;
                }
                index--;
                count = 0;
            }
        }
    }
    
    if (index >= 0) {
        show_message("colums index >= 0 - count=" + string(count) + ", index=" + string(index));
        return false; // It's a wrong number of numbers
    }
}

// Compare numbers for rows
for (var field_index_y = fields_y - 1; field_index_y >= 0; field_index_y--) {

    count = 0;
    list = row_numbers[field_index_y];
    index = ds_list_size(list) - 1;
    
    for (var field_index_x = fields_x - 1; field_index_x >= 0; field_index_x--) {
        
        // column_numbers
        if (game_field[field_index_y, field_index_x] == 1) {
            count++;
        }
        
        // Chain ended or border reached
        if (game_field[field_index_y, field_index_x] != 1 || field_index_x == 0) {
            if (count > 0) { // Check the number
                if (count != list[|index]) {
                    show_message("rows count != list[|index] - count=" + string(count) + ", index=" + string(index) + ", list[|index]=" + string(list[|index]) + ", field_index_x=" + string(field_index_x) + ", field_index_y=" + string(field_index_y));
                    return false;
                }
                index--;
                count = 0;
            }
        }
    }
    
    if (index >= 0) {
        show_message("rows index >= 0 - count=" + string(count) + ", index=" + string(index));
        return false; // It's a wrong number of numbers
    }
}

/*for (var field_index_x = fields_x - 1; field_index_x >= 0; field_index_x--) {
    for (var field_index_y = fields_y - 1; field_index_y >= 0; field_index_y--) {
    
        if (solution[field_index_y, field_index_x] == 1) {
            if (game_field[field_index_y, field_index_x] != 1) {
                return false;
            }
        }
        else {
            if (game_field[field_index_y, field_index_x] == 1) {
                return false;
            }
        }
        
    }
}*/

return true;

#define picross_clear_array
/// picross_clear_array(array2D)
// Sets all fields to zero.
// by BadToxic

var array, fields_x, fields_y;

array = argument0;

fields_x = array_length_2d(array, 0);
fields_y = array_height_2d(array);

for (var field_index_x = fields_x - 1; field_index_x >= 0; field_index_x--) {
    for (var field_index_y = fields_y - 1; field_index_y >= 0; field_index_y--) {
    
        array[field_index_y, field_index_x] = 0;
        
    }
}

return array;

#define picross_create_ui_nodes
/// picross_create_ui_nodes(game_field)
// Creates nodes representing the corners of the fields in the game area.
// So there must be (fields_x + 1) x (fields_y + 1) nodes
// by BadToxic

var game_field, nodes_x, nodes_y, ui_nodes, node, xx, yy;

game_field = argument0;

nodes_x = array_length_2d(game_field, 0) + 1;
nodes_y = array_height_2d(game_field) + 1;

xx = game_area_x2;
for (var node_index_x = nodes_x - 1; node_index_x >= 0; node_index_x--) {

    yy = game_area_y2;
    for (var node_index_y = nodes_y - 1; node_index_y >= 0; node_index_y--) {
    
        node = instance_create(game_area_mx, game_area_my, obj_picross_ui_node);
         
        node.x_target_start = xx;
        node.y_target_start = yy;
        node.x_target = xx;
        node.y_target = yy;
         
        ui_nodes[node_index_y, node_index_x] = node;
        
        yy -= field_size;
    }
    xx -= field_size;
}

return ui_nodes;

#define picross_reposition_ui_nodes
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
        // node.x = xx;
        // node.y = yy;
        
        yy -= field_size;
    }
    xx -= field_size;
}

#define picross_count_numbers
/// picross_count_numbers(solution)
// Runs through all columns and rows and counts the numbers to display next to the game area.
// Stores them in the arrays row_numbers and column_numbers.
// by BadToxic

var solution, fields_x, fields_y, /*row_numbers, column_numbers,*/ count, list;

solution = argument0;

fields_x = array_length_2d(solution, 0);
fields_y = array_height_2d(solution);

// Get numbers for colums
for (var field_index_x = fields_x - 1; field_index_x >= 0; field_index_x--) {

    count = 0;
    list = ds_list_create();
    
    for (var field_index_y = fields_y - 1; field_index_y >= 0; field_index_y--) {
        
        // column_numbers
        if (solution[field_index_y, field_index_x] == 1) {
            count++;
        }
        
        // Chain ended or border reached
        if (solution[field_index_y, field_index_x] == 0 || field_index_y == 0) {
            if (count > 0) { // Add the number
                ds_list_insert(list, 0, count);
                count = 0;
            }
        }
    }
    
    column_numbers[field_index_x] = list;
}

// Get numbers for rows
for (var field_index_y = fields_y - 1; field_index_y >= 0; field_index_y--) {

    count = 0;
    list = ds_list_create();
    
    for (var field_index_x = fields_x - 1; field_index_x >= 0; field_index_x--) {
        
        // column_numbers
        if (solution[field_index_y, field_index_x] == 1) {
            count++;
        }
        
        // Chain ended or border reached
        if (solution[field_index_y, field_index_x] == 0 || field_index_x == 0) {
            if (count > 0) { // Add the number
                ds_list_insert(list, 0, count);
                count = 0;
            }
        }
    }
    
    row_numbers[field_index_y] = list;
}

#define picross_zoom_node
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

#define picross_solve_column_range
/// picross_solve_column_range(game_field, column_numbers, field_index_x, field_index_y_start, field_index_y_end)
// Tries to fill as much fields in a column as possible
// and returns true if one or more new fields could be set.
// NOT FINISHED
// by BadToxic

var game_field, column_numbers, field_index_x, field_index_y_start, field_index_y_end, field_index_y, fields_y;

game_field          = argument0;
column_numbers      = argument1;
field_index_x       = argument2;
field_index_y_start = argument3;
field_index_y_end   = argument4;

// fields_x = array_length_2d(game_field, 0);
fields_y = array_height_2d(game_field);
numbers  = array_length_1d(column_numbers);

// No move possible
if (numbers == 0) {
    return false;
}

var highest_number = 0;
var highest_number_position = 0;
var sum_before = 0; // Sum of all numbers plus gaps before the highest number can start
var sum_after = 0;  // Sum of all numbers plus gaps after the highest number can start
var sum_after_tmp = 0;

// Find highest number and its position
for (var number_index = numbers - 1; number_index >= 0; number_index--) {
    if (column_numbers[number_index] > highest_number) {
        highest_number = column_numbers[number_index];
        highest_number_position = number_index;
        sum_before = 0;
        sum_after = sum_after_tmp;
    }
    else {
        sum_before += column_numbers[number_index] + 1;
    }
    sum_after_tmp += column_numbers[number_index] + 1;
}

// 
for (var field_index_y = fields_y - 1; field_index_y >= 0; field_index_y--) {
    // TODO
}


#define picross_start_new_game
/// picross_start_new_game(fields_x, fields_y);
// Creates a new game with a game area of the given size.
// by BadToxic

var new_fields_x = argument0;
var new_fields_y = argument1;

// Delete old structures
if (is_array(row_numbers)) {
    //var fields_y = array_height_2d(solution);

    // Destroy Numbers for rows
    for (var field_index_y = fields_y - 1; field_index_y >= 0; field_index_y--) {
        list = row_numbers[field_index_y];     
        ds_list_destroy(list);
    }

    row_numbers = noone;
}
if (is_array(column_numbers)) {
    //var fields_x = array_length_2d(solution, 0);
    
    // Destroy Numbers for colums
    for (var field_index_x = fields_x - 1; field_index_x >= 0; field_index_x--) {
        list = column_numbers[field_index_x];        
        ds_list_destroy(list);
    }
    
    column_numbers = noone;
}
with (obj_picross_ui_node) {
    instance_destroy();
}

solution = noone;
ui_nodes = noone;
game_field_clicked = noone;
game_field = noone;

fields_x = new_fields_x;
fields_y = new_fields_y;

// Initialize empty game area
game_field = picross_create_empty_game_field(fields_x, fields_y);
game_field_marks = 0; // Number of marks the current game area has

// Array to remember if it was clicked
game_field_clicked = picross_create_empty_game_field(fields_x, fields_y);
click_command = undefined;

// User Interface nodes for graphic effects (obj_picross_ui_node)
if (use_ui_nodes) {
    ui_nodes = picross_create_ui_nodes(game_field);
}


// And create a random solution
solution = picross_generate_random_pattern(fields_x, fields_y);
solution_marks = picross_count_marks(solution); // Number of marks the solution has

// Count the numbers to display next to the game area.
// Stores them in the arrays row_numbers and column_numbers.

picross_count_numbers(solution);

is_solved = false;
time = 0;
time_str = seconds_2_time(time);

#define picross_choose_random_game_area_size
/// picross_choose_random_game_area_size();
// Choses a random number of the available game area sizes for both,
// horicontal and vertical field numbers.
// by BadToxic

fields_x = game_area_sizes[|irandom(ds_list_size(game_area_sizes) - 1)];
fields_y = game_area_sizes[|irandom(ds_list_size(game_area_sizes) - 1)];


