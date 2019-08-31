

global.wmx_prev=global.wmx_curr;
global.wmy_prev=global.wmy_curr;

global.wmx_curr=window_mouse_get_x();
global.wmy_curr=window_mouse_get_y();

global.cursor_moved=(global.wmx_prev!=global.wmx_curr || global.wmy_prev!=global.wmy_curr);

var yes_please_regenerate_grid=false;
var zero_equals_one=false;

if (global.camera_zooming==false)
{
if (global.camera_dragging==false)
{

var zoom_changed=false;

if (global.zoom_level>-4)
{
if (mouse_wheel_up())
    {
    //increase
    global.zoom_magnitude_next=global.zoom_magnitude+global.zoom_step;
    global.zoom_level-=1;
    zoom_changed=true;
    
    }
}

if (global.zoom_level<4)
{
if (mouse_wheel_down())
    {
    //decrease
    global.zoom_magnitude_next=global.zoom_magnitude-global.zoom_step;
    global.zoom_level+=1;
    zoom_changed=true;
    
    }
}

if (zoom_changed==true)
    {
    global.camera_zoom_timer=global.camera_zoom_timer_increment;
    global.camera_zooming=true;
    global.zoom_magnitude_temporary=global.zoom_magnitude;
    
    global.mouse_x_locked=mouse_x;
    global.mouse_y_locked=mouse_y;
    
    applyZoom();
    
    }
}
else
{
yes_please_regenerate_grid=true;
}

}
//else we're zooming
{
yes_please_regenerate_grid=true;

global.zoom_magnitude_temporary=lerp(global.zoom_magnitude_next,global.zoom_magnitude,(global.camera_zoom_timer^2)/(global.camera_zoom_timer_increment^2));

global.camera_zoom_timer-=1;
if (global.camera_zoom_timer<1)
    {
    global.zoom_magnitude_temporary=global.zoom_magnitude_next;
    global.zoom_magnitude=global.zoom_magnitude_next;
    global.camera_zooming=false;
    
    //round off the delta
    global.delta_x=(global.delta_x);
    global.delta_y=/*round*/(global.delta_y);
    }
applyZoom();
}

if (yes_please_regenerate_grid==true && zero_equals_one==true)
{
drawInfiniteGrid(16);
}
