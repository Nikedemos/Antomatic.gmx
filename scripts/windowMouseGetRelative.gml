///windowMouseGetRelative(window)
//
//first, does the window have a bar?
var extra=0;

if (argument[0].controls==true)
    extra=global.window_bar_height;

argument[0].mouse_over_x=global.wmx_curr-argument[0].window_x;
argument[0].mouse_over_y=global.wmy_curr-(argument[0].window_y+extra);
