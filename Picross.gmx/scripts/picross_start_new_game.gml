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
