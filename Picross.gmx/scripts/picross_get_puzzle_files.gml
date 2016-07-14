/// picross_get_puzzle_files()
// Looks for all puzzle (.pic) files in the game folder and stores them in a list
// by BadToxic

// var files = ds_list_create(); // Use existing list instead

show_debug_message("Search for puzzle files in " + puzzle_folder);
        
if (directory_exists(puzzle_folder)) {
    var file;
    file = file_find_first(puzzle_folder + "*.pic", 0);
    ds_map_clear(puzzle_images);
    
    if (file == "") {
        show_debug_message("-> No puzzle files found!");
    } else while (file != "") {
        
        show_debug_message("- Found puzzle file " + file);
        
        picross_add_puzzle_file(file);
        
        file = file_find_next();
    }
    
    file_find_close();
    
}

return puzzle_files;
