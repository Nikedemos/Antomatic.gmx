//first check: are we currently dragging/resizing a window?
//if yes, releasing the left button anywhere
//will just cease the dragging activity. clear mouse left.

//if we're focused on a window, is that window close_pressed true?
//if so, no need for guiMouseCommon

var we_have_a_closer=false;

if (global.window_focus!=noone)
    {
    if (global.window_focus.close_pressed==true)
        {
        //do the partial guiMouseCommon
        we_have_a_closer=true;
        }
    }

if (global.dragging!=noone)
{
global.dragging=noone;
mouse_clear(mb_left);
}
else
{
var maybe_window=guiMouseCommon(false);

var perform_close_check=true;

if (maybe_window!=noone)
    {

    if (global.wmy_curr<maybe_window.window_y+global.window_bar_height)
        {
        //we left-released on the bar - check if it's the X button
        if (global.wmx_curr>maybe_window.window_x+maybe_window.window_width-global.window_close_button_width)
            {
            //check if it's yours!
            if (we_have_a_closer==true)
                {
                if (maybe_window==global.window_focus) //yes that's you
                    {
                    windowClose(maybe_window);
                    perform_close_check=false; //it won't exist now, no point in changing its aux. variables
                    }
                else
                    {
                    //some other window
                    global.window_focus.close_pressed=false;
                    }
                }
            }
        }

    if (perform_close_check==true)
        {
        if (we_have_a_closer==true)
        if (global.window_focus.close_pressed==true)
            {
            global.window_focus.close_pressed=false;
            }  
        }
    
        
    mouse_clear(mb_left);
    }
else
    {
     //we didn't hit any windows with left released. BUT. if we're focused on one, clear its aux variables, still!
     if (global.window_focus!=noone)
        {
        if (global.window_focus.close_pressed==true)
            global.window_focus.close_pressed=false;
        }
    }

}

