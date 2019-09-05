///windowAlign(objWindow,halign,valign,offset_x,offset_y);
//aligns a window to middle, corners, edges, etc +-offsets

var windy=argument[0];
var halign=argument[1];
var valign=argument[2];
var offset_x=argument[3];
var offset_y=argument[4];

switch (halign)
    {
    case GUI_CENTER: windy.window_x=GUI_CENTER-(windy.window_width)/2+offset_x; break;
    case GUI_LEFT: windy.window_x=GUI_LEFT+offset_x; break;
    case GUI_RIGHT: windy.window_x=GUI_RIGHT-(windy.window_width)+offset_x; break;
    }

switch (valign)
    {
    case GUI_MIDDLE: windy.window_y=GUI_MIDDLE-(windy.window_height)/2+offset_y; break;
    case GUI_TOP: windy.window_y=GUI_TOP+offset_y; break;
    case GUI_BOTTOM: windy.window_y=GUI_BOTTOM-(windy.window_height)+offset_y; break;    
    }
