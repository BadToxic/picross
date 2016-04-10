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
