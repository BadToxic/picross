/// picross_load_puzzle(fname);
// Loads pattern from the given filename and uses it as solution for a new game
// that will be started after loading.
// by BadToxic

var fname;

fname = argument0;

picross_start_new_game(0, 0, picross_load_pattern(fname));
