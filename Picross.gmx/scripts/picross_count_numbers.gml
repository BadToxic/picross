/// picross_count_numbers(solution)
// Runs through all columns and rows and counts the numbers to display next to the game area.
// Stores them in the arrays row_numbers and column_numbers.
// by BadToxic

var solution, fields_x, fields_y, /*row_numbers, column_numbers,*/ count, list;

solution = argument0;

fields_x = array_length_2d(solution, 0);
fields_y = array_height_2d(solution);

// Get Numbers for colums
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

// Get Numbers for rows
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
