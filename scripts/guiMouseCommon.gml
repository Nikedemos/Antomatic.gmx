///guiMouseCommon(set_dephts_and_focuses_true_or_false)
//true would be when you clicked

var set_depths=argument[0];

var min_depth_all=0;
var caught_all=noone;

var min_depth_in_range=0;
var caught_in_range=noone;

with (objWindow)
    {
    var maybe=global.window_bar_height;
    
    //take barless into account
    if (controls==false)
        {
        maybe=0;
        }
        
    if (megafocus==false)
    if (depth<min_depth_all)
        {
        min_depth_all=depth;
        caught_all=id;
        }
    
    //check if the global.wmx_curr and global.wmy_curr are within bounds
    if (global.wmx_curr>=window_x && global.wmy_curr>=window_y && global.wmx_curr<window_x+window_width && global.wmy_curr<window_y+window_height+maybe)
        {
        //yes, there's a window underneath the window_mouse_x/y
            if (depth<min_depth_in_range or megafocus==true) //we always take the last megafocused one
                {
                min_depth_in_range=depth;
                caught_in_range=id;
                }
        }
    }

if (caught_in_range==noone)
    {
    //no windows found over there.

    }    
else
    {
    //now that we got min_depth and caught_window -
    //iterate through all the OTHER windows (not just the ones underneath!)
    //to shift their depth. the value by which the depth is shifted (added)
    
    if (caught_in_range.megafocus==false) //we don't do anything here, the window already thinks it has focus
        {
        //if the you are already the lowest depth, no point in shifting anyttin'.
        if (caught_in_range==caught_all)
            {
            //just focus on that window
            global.window_focus=caught_in_range;
            
            //show_message("Still the same window");
            }
        else
            {
            if (set_depths==true) //false will just return the caught_in_range
                {
                var prev_focus=global.window_focus;
                global.window_focus=caught_in_range;
                
                //what's its current depth? anything with depth LESS than that value
                //need to be shifted down
                var treshold_depth=caught_in_range.depth;
                
                //and now we can give it minimum depth
                global.window_focus.depth=min_depth_all-1;
                
                //and now, all the windows "after" the old depth of the window
                with (objWindow)
                    {
                    //if (global.window_focus!=id)
                        {
                        if (depth<treshold_depth)
                            depth++;
        
                        }
                    
                    //currently no need to regenerate canvases for ALL windows!
                    //regenerateWindowCanvases(id,true,false,false);
                    }     
                
                //check if this works
                global.window_depth_counter=min_depth_all-1;
                
                with (prev_focus)
                    regenerateWindowCanvases(id,true,false,false);
                with (global.window_focus)
                    regenerateWindowCanvases(id,true,false,false);
                }
            } 
        }
    //now the window we clicked on is in focus (or already was in focus)
    }

return caught_in_range;

