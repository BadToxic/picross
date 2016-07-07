/// picross_get_puzzle_files()
// Looks for all puzzle (.pic) files in the game folder and stores them in a list
// by BadToxic

var files = ds_list_create();

show_debug_message("Search for puzzle files in " + puzzle_folder);
        
if (directory_exists(puzzle_folder)) {
    var file;
    file = file_find_first(puzzle_folder + "*.pic", 0);
    
    if (file == "") {
        show_debug_message("-> No puzzle files found!");
    } else while (file != "") {
        ds_list_add(files, file);
        show_debug_message("- Found puzzle file " + file);
        file = file_find_next();
    }
    
    file_find_close();
    
}

return files;
