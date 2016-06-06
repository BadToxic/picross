/// picross_choose_random_game_area_size();
// Choses a random number of the available game area sizes for both,
// horicontal and vertical field numbers.
// by BadToxic

fields_x = game_area_sizes[|irandom(ds_list_size(game_area_sizes) - 1)];
fields_y = game_area_sizes[|irandom(ds_list_size(game_area_sizes) - 1)];

