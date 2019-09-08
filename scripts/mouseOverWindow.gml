///mouseOverWindow(window)
//
//first, does the window have a bar?
var extra=0;

if (argument[0].controls==true)
    extra=global.window_bar_height;

//in this implementation, we don't count the mouse over the bar as "over the window".
//the main purpose of these 3 functions (isWindowHoverable, mouseOverWindow and windowMouseGetRelative
//is to handle hovering over elements inside the window (whatever it has).
//clicking/releasing/mouse wheel up/down etc will STILL be done from the gui*Pressed/gui*Released
//pipeline (since we don't want to register clicks on multiple windows simultaneously)
    
return (global.wmx_curr>=argument[0].window_x && global.wmx_curr<argument[0].window_x+argument[0].window_width && global.wmy_curr>=argument[0].window_y+extra && global.wmy_curr<argument[0].window_y+argument[0].window_height+extra);
