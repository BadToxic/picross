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
