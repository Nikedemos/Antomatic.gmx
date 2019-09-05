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


//egenerate the caption bar of the previously focused on window
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
windowAlign(window,GUI_CENTER,GUI_MIDDLE,0,0);
    
return window;
