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
