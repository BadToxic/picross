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
