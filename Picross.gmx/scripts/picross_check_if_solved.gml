/// picross_check_if_solved(game_field, solution)
// Returns true if game_field is solved, else false.
// by BadToxic

var game_field, solution, fields_x, fields_y;

game_field = argument0;
solution = argument1;

fields_x = array_length_2d(game_field, 0);
fields_y = array_height_2d(game_field);

if (fields_x != array_length_2d(solution, 0) || fields_y != array_height_2d(solution)) {
    return false; // Dimension missmatch
}

for (var field_index_x = fields_x - 1; field_index_x >= 0; field_index_x--) {
    for (var field_index_y = fields_y - 1; field_index_y >= 0; field_index_y--) {
    
        if (solution[field_index_y, field_index_x] == 1) {
            if (game_field[field_index_y, field_index_x] != 1) {
                return false;
            }
        }
        
    }
}

return true;
