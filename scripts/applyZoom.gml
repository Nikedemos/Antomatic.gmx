//we want to take into account current mouse x and y.
//move the mx and my point to the centrepoint.
//okay, what's the centrepoint?
var cx=mean(view_xview[0],view_xview[0]+view_wview[0]);
var cy=mean(view_yview[0],view_yview[0]+view_hview[0]);

//what's the difference between mx,my and cx,cy?
var diff_x=cx-global.mouse_x_locked;
var diff_y=cy-global.mouse_y_locked;

//remember current zoom level
var previous_zoom=global.zoom;

//shift viewx,y
global.delta_x-=diff_x;
global.delta_y-=diff_y;

//resize the view. 


global.zoom=1/exp(global.zoom_magnitude_temporary-1);

view_wview[0]=(global.zoom*view_wport[0]);
view_hview[0]=(global.zoom*view_hport[0]);

getXViewYViewFromDeltaXY();

//now, we need to use ratios:
/*
previous_zoom/current_zoom = diff_xORy/new_diff_xORy;

*/

var new_diff_x = (global.zoom*diff_x)/previous_zoom;
var new_diff_y = (global.zoom*diff_y)/previous_zoom;

//now shift back
global.delta_x+=new_diff_x;
global.delta_y+=new_diff_y;


//and re-apply
getXViewYViewFromDeltaXY();

//view_xview[0]-=new_diff_x;
//view_yview[0]-=new_diff_y;


