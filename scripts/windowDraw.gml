//this is all assuming that a window has a bar!
//if not, instead of +global.window_bar_height, just go with 0
var shift_y=0;

if (controls==true)
{
if (background_exists(bar_canvas))
    {
    draw_background(bar_canvas,window_x,window_y);
    //partial bar canvas for the X button pressing
    
    if (close_pressed==true)
        {
        //draw_set_blend_mode(bm_add);
        draw_background_part(bar_canvas,window_width-global.window_close_button_width,0,global.window_close_button_width-2,global.window_bar_height-2,2+window_x+(window_width-global.window_close_button_width),2+window_y);
        //draw_set_blend_mode(bm_normal);
        }
    }
shift_y=global.window_bar_height;
}

if (background_exists(background_canvas))
draw_background(background_canvas,window_x,window_y+shift_y);

var border_colour=c_dkgray;
if (global.window_focus==id && window_active==true)
    border_colour=global.window_bar_colour[1];

if (border==true)
{
draw_set_color(border_colour);
draw_rectangle(window_x-1,window_y-1,window_x+window_width,window_y+shift_y+window_height,1);
}

//and now whatever else the window might draw

if (action_draw!=noone)
    if (script_exists(action_draw))
        {
        script_execute(action_draw);
        }

/*
if (background_exists(window_canvas))
draw_background(window_canvas,window_x,window_y+global.window_bar_height);

