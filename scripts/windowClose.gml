///windowClose(window)

var winny=argument[0];

//destroy the canvases
if (background_exists(winny.bar_canvas))
    background_delete(winny.bar_canvas);

if (background_exists(winny.background_canvas))
    background_delete(winny.background_canvas);

if (surface_exists(winny.window_canvas))
    surface_free(winny.window_canvas);


//destroy the window's elements list


//and now the element list itself

//and now that particular window    
with (winny) instance_destroy();

//now set the focus to the topmost instance
var topmost_depth=0;
var topmost_found=noone;

//THOSE ARE SUM MANLY TEARS DAMN IT
//Key and Peele ftw.
var found_at_least_one=true;
var at_least_one_is_normal=false;

if (instance_number(objWindow)==0)
    {
    found_at_least_one=false;
    }
else
    {
    with (objWindow)
        {
        if (megafocus==false)
            at_least_one_is_normal=true; //that means at least 1 isn't
        }
    }

if (found_at_least_one && at_least_one_is_normal)
{
with (objWindow)
    {
    if (megafocus==false)
    if (depth<topmost_depth)
        {
        topmost_depth=depth;
        topmost_found=id;
        }
    }
global.window_focus=topmost_found;
regenerateWindowCanvases(topmost_found,true,false,false);
    
//and set the depth counter to the topmost instance's new depth minus 1
global.window_depth_counter=topmost_found.depth-1;
}
else
{
//no other windows on screen, so just reset the depth counter
global.window_depth_counter=global.gui_depth_starts_at;

}

