///regenerateWindowCanvases(window,yes_regenerate_bar,yes_regenerate_background,yes_renegerate_window)
//

var winny=argument[0];

var yes_bar=argument[1];
var yes_background=argument[2];
var yes_window=argument[3];

var surfey=-1;

var is_in_focus=(global.window_focus==winny.id);

//we need to take into account several global and window properties:
/*

if you're regenerating the bar:
whether the window is in focus take the proper bar colour
and the font colour

window_width, window_height
window_bgcolour

*/
if (yes_bar)
    {
    //first, check if that background exists - if it does, delete it and create a new one
    //in the classic, "painting" way. for performance. I mean, you have 20 windows open, chunks to draw, entities...
    //imagine drawing everything procedurally every frame
    
    if (background_exists(winny.bar_canvas))
        {
        background_delete(winny.bar_canvas);
        }
    
    surfey=surface_create(winny.window_width,global.window_bar_height);
    surface_set_target(surfey);
    //we're just gonna paint this whole thing over, thank you very much
    draw_clear_alpha(global.window_bar_colour[is_in_focus],1);
    
    //icon...
    draw_sprite_ext(winny.icon,0,8+global.window_spacer,8+global.window_spacer,1,1,0,c_white,1);
    
    //now the caption...
    draw_set_colour(global.window_caption_colour[is_in_focus]);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_left);
    draw_set_font(global.window_caption_font);
    draw_text(16+2*global.window_spacer,global.window_bar_height/2,winny.caption);
    
    //and the unpressed x button
    draw_sprite_ext(spr1pix,0,winny.window_width-global.window_close_button_width,0,global.window_close_button_width,global.window_bar_height,0,c_red,1);
    draw_sprite_ext(sprX,0,winny.window_width-global.window_close_button_width+4,0,1,1,0,c_white,1);    
    surface_reset_target();
    
    winny.bar_canvas=background_create_from_surface(surfey,0,0,winny.window_width,global.window_bar_height,0,0);
    
    surface_free(surfey);
    }

if (yes_background)
    {
    if (background_exists(winny.background_canvas))
        {
        background_delete(winny.background_canvas);
        }    
    //simple case: we just create a plain-coloured background here
    winny.background_canvas=background_create_colour(winny.window_width,winny.window_height,winny.bgcolour);
    }


