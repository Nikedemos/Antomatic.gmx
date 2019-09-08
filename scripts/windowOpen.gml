///windowOpen(window_init_script,script_specific_parameters_in_quotes_separated_by_comma)
//returns the newly created window object
var window=instance_create(1337,420,objWindow); //we're not gonna use "real" x and y values
var script=argument[0];
var params=argument[1];

//some default values
window.caption="New Window";
window.icon=sprAnt;
window.window_x=0;
window.window_y=0;
window.window_width_default=640;
window.window_height_default=480;
window.window_width=640;
window.window_height=480; //when resized, these will change, the ones above wills stay the same
window.bgcolour=global.window_bgcolour_default;
window.bgalpha=1;
window.window_alpha=1;
window.close_pressed=false;
window.border=true;
window.mouse_over=false;
window.mouse_over_x=-1;
window.mouse_over_y=-1;

window.action_step=noone; //what does the window do in the step event?
window.action_draw=noone; //what does the window draw on its "window canvas" surface?

window.megafocus=false;

//megafocus means that the window always considers itself "in" focus
//(unless we're closing, dragging another window, resizing, etc)
//it also means it's not gonna get considered when shifting depths,
//setting focus etc
//we just give it depth that starts at megafocus_depth_offset.
//ideally, you have 2-3 megafocus windows - one, borderless, is the taskbar,
//and some bordered ones, like tool palletes, status bars etc.
//their depths don't change. just make it high enough.

//when something places itself in the window, based on its x,y placement and width and height,
//we will decide whether to perform overflow actions (scrollbars or stretching window).
//auto-stretching the window will be useful for dialog boxes,
//and overflow with horizontal wrap and vertical scrollbars for toolboxes, browsers etc.

window.controls=true; //if false, no bars, no controls, no nintendo, no nuttin'
window.draggable=true;
window.resizable=false;
window.window_active=true;

window.depth=global.window_depth_counter;

global.window_depth_counter-=1;

//and then
window.bar_canvas=-1; //can be a background
window.background_canvas=-1; //can be a background
window.window_canvas=-1; //this is where we draw... can be a surface, easy peasy

//bar canvas is 
//and now script-specific stuff
if (script_exists(asset_get_index(script)))
    {
    with (window) script_execute(asset_get_index(script),params);
    }


//generate the window and bar canvases
var prev_window_focus=global.window_focus;

global.window_focus=window.id;


//regenerate the caption bar of the previously focused on window
// - if it exists, that is!

if (prev_window_focus!=noone)
    {
    if (instance_exists(prev_window_focus))
    regenerateWindowCanvases(prev_window_focus,true,false,false);
    }


//regenerate yourself fully...
regenerateWindowCanvases(window,true,true,true); //we ain't got no nintendo, no nuttin', we need all 3 of those

//centre window based on width, height and gui size
//this function takes the width and height into account
    
return window;
