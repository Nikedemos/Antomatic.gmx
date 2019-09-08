if (mouse_check_button_pressed(mb_left))
    {
    guiLeftPressed();
    }
        
if (mouse_check_button_pressed(mb_right))
    {
    guiRightPressed();
    }

if (mouse_check_button_released(mb_left))
    {
    guiLeftReleased();
    }
    
if (global.dragging!=noone)
    {
    global.dragging.window_x=global.wmx_curr+global.dragging_delta_x;
    //we're gonna limit the y - the menu bar is currenty 32px
    global.dragging.window_y=max(32,global.wmy_curr+global.dragging_delta_y);
    }
