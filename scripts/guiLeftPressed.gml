//check if there's any windows underneath -
//take the window with the smallest depth (means it's the one on top)
//activate that window by putting it in focus
//deactivate all other windows
//shift depth
//
//this will focus on the window and bring it to the top depth-wise
var maybe_window=guiMouseCommon(true);

if (maybe_window!=noone)
    {
    //decide whether we're dragging the window, closing it or
    //clicking inside it for whatever reason. dragging is universal,
    //same for all windows. closing invokes a default close action,
    //clicking inside of the window invokes the window mouse action
    //for the left button (here in this example)
    
    
    if (maybe_window.controls==true && (global.wmy_curr<maybe_window.window_y+global.window_bar_height))
        {
        //we left-clicked on the bar - check if it's the X button
        if (global.wmx_curr>maybe_window.window_x+maybe_window.window_width-global.window_close_button_width)
            {
            maybe_window.close_pressed=true;
            }
        else
            {
            if (maybe_window.draggable==true)
                {
                //all the windows stop dragging now
                global.dragging=maybe_window;
                global.dragging_delta_x=maybe_window.window_x-global.wmx_curr;
                global.dragging_delta_y=maybe_window.window_y-global.wmy_curr;
                }   
            }
        }
    else
        {
        //show_message("CLICK_INSIDE_WINDOW!");
        }
    
    mouse_clear(mb_left);
    }
