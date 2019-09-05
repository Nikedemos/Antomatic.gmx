global.gui_depth_starts_at=-10000; //to make sure everything is on the very, very top
global.window_focus=noone;

global.window_bar_height=24;
global.window_close_button_width=32;

global.close_button_colour=c_red;
global.window_bar_colour=c_gray;

//0 means no focus, 1 means focus
global.window_bar_colour[0]=c_dkgray;
global.window_bar_colour[1]=make_colour_rgb(42,31,170);

global.window_caption_colour[0]=c_ltgray;
global.window_caption_colour[1]=c_white;

global.window_bgcolour_default=c_gray;

global.window_spacer=4;
global.window_caption_font=fntMediumBold;
global.window_depth_counter=global.gui_depth_starts_at;

global.dragging=noone; //if dragging, asign id to that variable
global.dragging_delta_x=0;
global.dragging_delta_y=0;

global.lock_gui=false;
//locked gui means there's a window/dialog that needs to be closed
//before we can switch to any other windows or interact with the game

//test windows
var w1=windowOpen("test","test");
var w2=windowOpen("test","test");
var w3=windowOpen("test","test");

w1.window_x-=100;
w1.window_y-=100;

w2.window_x-=200;
w2.window_y-=200;
