///windowClose(window)

var winny=argument[0];

//destroy the canvases
if (background_exists(winny.bar_canvas))
    background_delete(winny.bar_canvas);

if (background_exists(winny.background_canvas))
    background_delete(winny.background_canvas);

if (surface_exists(winny.window_canvas))
    surface_free(winny.window_canvas);

with (winny) instance_destroy();

//now set the focus to the topmost instance
var topmost_depth=0;
var topmost_found=noone;

if (instance_number(objWindow)>0)
{
with (objWindow)
    {
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

