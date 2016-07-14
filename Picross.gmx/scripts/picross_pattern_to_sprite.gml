/// picross_pattern_to_sprite(pattern);
// Creates a sprite from a pattern.
// by BadToxic

var pic, surface, width, height, pattern;

width  = 64;
height = 64;

pattern = argument0;

surface = surface_create(width, height);

if (surface_exists(surface)) {
    surface_set_target(surface);
    
    draw_clear_alpha(c_black, 0);
    
    var fields_x, fields_y;

    fields_x = array_length_2d(pattern, 0);
    fields_y = array_height_2d(pattern);
    
    var field_size = min(width / fields_x, height / fields_y);
    var used_width = fields_x * field_size;
    var used_height = fields_y * field_size;
    
    var x_start = (width  - used_width)  / 2;
    var y_start = (height - used_height) / 2;
    
    // draw_clear(c_yellow);
    
    draw_set_colour(c_white);
    draw_rectangle(x_start, y_start, x_start + used_width, y_start + used_height, false);
    
    draw_set_colour(c_black);

    var xx, yy = y_start;
    
    // Run through the game area and draw the marks of the pattern    
    for (var field_index_y = 0; field_index_y < fields_y; field_index_y++) {
        xx = x_start;
        for (var field_index_x = 0; field_index_x < fields_x; field_index_x++) {
            
            if (pattern[field_index_y, field_index_x]) {
                draw_rectangle(xx, yy, xx + field_size, yy + field_size, false);
            }
            xx += field_size;
            
        }
        yy += field_size;
    }
    
    
    surface_reset_target();
    
    
    pic = sprite_create_from_surface(surface, 0, 0, width, height, false, false, width / 2, height / 2);
    show_debug_message("picross_pattern_to_sprite: Successfully create sprite from pattern!");
    
    return pic;
} else {
    show_debug_message("picross_pattern_to_sprite: surface does not exist!");
}

return noone;
