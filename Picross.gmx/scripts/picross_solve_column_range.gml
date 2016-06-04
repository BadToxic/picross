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

