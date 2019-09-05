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
    global.dragging.window_y=global.wmy_curr+global.dragging_delta_y;
    }
