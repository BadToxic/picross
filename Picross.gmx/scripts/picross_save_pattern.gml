/// picross_save_pattern(fname)
// Saves the current pattern to the given filename.
// by BadToxic

var file, fname;

fname = argument0;
file = file_text_open_write(fname);

if (file == -1) {
    show_debug_message("Could not write to file " + fname);
    return false;
}

var fields_x, fields_y;

fields_x = array_length_2d(game_field, 0);
fields_y = array_height_2d(game_field);

// Write info line: x, y, number
file_text_write_string(file, string(fields_x) + " ");
file_text_write_string(file, string(fields_y) + " ");
file_text_write_string(file, string(game_field_marks));
file_text_writeln(file);

// Run through the game area and write 0s and 1s
for (var field_index_y = 0; field_index_y < fields_y; field_index_y++) {
    for (var field_index_x = 0; field_index_x < fields_x; field_index_x++) {
        
        file_text_write_string(file, string(game_field[field_index_y, field_index_x]) + " ");
        
    }
    
    file_text_writeln(file);
}

file_text_close(file);
show_debug_message("Successfully wrote pattern to file " + fname);

return true;
