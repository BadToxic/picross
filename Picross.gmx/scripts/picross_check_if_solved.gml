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
