/// picross_load_pattern(fname, dest)
// Loads pattern from the given filename and returns it as an new 2D array.
// by BadToxic

var file, fname;

fname = argument0;
file = file_text_open_read(fname);

if (file == -1) {
    show_debug_message("Could not open file " + fname + " for reading");
    return false;
}

var pattern, fields_x, fields_y;

fields_x = file_text_read_real(file);
fields_y = file_text_read_real(file);
// game_field_marks

// Write something into the last array position to prevent multiple reallocations
pattern[fields_y - 1, fields_x - 1] = 0;

file_text_readln(file);

// Run through the game area and write 0s and 1s
for (var field_index_y = 0; field_index_y < fields_y; field_index_y++) {
    for (var field_index_x = 0; field_index_x < fields_x; field_index_x++) {
        
        pattern[field_index_y, field_index_x] = file_text_read_real(file);
        
    }
    
    file_text_readln(file);
}

show_debug_message("Successfully loaded pattern from file " + fname);

file_text_close(file);

return pattern;
