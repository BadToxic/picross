/// picross_add_puzzle_file(filename)
// Adds a puzzle file in the puzzle list
// by BadToxic

var file = argument0;

if (ds_list_find_index(puzzle_files, file)) {
    show_debug_message("(File already exists)");
} else {
    // All files
    ds_list_add(puzzle_files, file);
    
    // Sort files by pattern sizes
    
    var size_key;
    
    var size_string_length = string_pos("_", file);
    
    if (size_string_length > 0) {
        size_key = string_copy(file, 1, size_string_length - 1);
        
        if (size_key != "") {
            var list = ds_map_find_value(puzzle_files_by_size, size_key);
            
            if (is_undefined(list)) {
                list = ds_list_create();
                ds_map_add(puzzle_files_by_size, size_key, list);
            }
            
            var file_short = string_copy(file, size_string_length + 1, string_length(file) - size_string_length - 4);
            
            ds_list_add(list, file_short);
        }
    }
}

var pattern      = picross_load_pattern(puzzle_folder + file);
var puzzle_image = picross_pattern_to_sprite(pattern);

if (puzzle_image != noone) {
    if (ds_map_exists(puzzle_images, file)) {
        ds_map_replace(puzzle_images, file, puzzle_image);
    } else {
        ds_map_add(puzzle_images, file, puzzle_image);
    }
}
