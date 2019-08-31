//global.last_mouse_enter=noone;

global.show_grid=true;
global.frameskip=true;
global.frame=0;

//global.zoom_step=2.30258509299/2; //half of square root of 10
global.zoom_step=1.4142135623730950488016887242097; //half of square root of 8!

global.zoom_level=0; //auxilliary, read-only value, mainly for grids

global.zoom_magnitude=1; //this is what you mess with
global.zoom_magnitude_temporary=1;
global.zoom_magnitude_next=1; //used for smooth zooming
global.zoom=1; //calculated linear value
global.delta_x=0;
global.delta_y=0;
//view_xport[0]=room_width;
//view_yport[0]=room_height;
display_set_gui_size(view_wport[0],view_hport[0]);

//smooth zooming, based on camera's internal clock
//and vanilla alarms
global.camera_zooming=false;

//grid background. no need to re-generate it every step, just draw, beyotch
global.grid_bg=-1;
global.grid_surf=-1;

//sky background
global.sky_bg=-1;

global.skycolor1=make_color_rgb(44,94,255);
global.skycolor2=make_color_rgb(128,170,210);

global.sc1=global.skycolor1;
global.sc2=global.skycolor2;


global.camera_dragging=false;

global.camera_dragging_xstart=0;
global.camera_dragging_ystart=0;

global.camera_delta_x=0;
global.camera_delta_y=0;

//these variables keep track of the mouse x,y in the window.
//if they changed, only THEN you move the cam about with the
//middle wheel.


global.wmx_prev=window_mouse_get_x();
global.wmy_prev=window_mouse_get_y();

global.wmx_curr=global.wmx_prev;
global.wmy_curr=global.wmx_prev;

global.cursor_moved=false;

global.camera_zooming=false;
global.camera_zoom_timer=0;
global.camera_zoom_timer_increment=96; //1/10s

global.mouse_x_locked=0;
global.mouse_y_locked=0;


//

