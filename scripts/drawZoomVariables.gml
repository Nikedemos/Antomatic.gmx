draw_set_font(fntMedium);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var v_spacer=20;

var loggy=log10(round(global.zoom));

draw_text(10,v_spacer*6,"ZOOM LEVEL: "+string_format(global.zoom_level,0,2));
draw_text(10,v_spacer*7,"ZOOM MAGNITUDE: "+string_format(global.zoom_magnitude,0,2));
draw_text(10,v_spacer*8,"ORDER (POWER OF 10): "+string_format(loggy,0,2));
draw_text(10,v_spacer*9,"ZOOM MULTIPLIER: "+string_format(global.zoom,0,8));
draw_text(10,v_spacer*10,"CAMERA DELTA (X, Y): "+string_format(global.delta_x,0,8)+", "+string_format(global.delta_y,0,8));
draw_text(10,v_spacer*11,"DISPLAY MX,MY: "+string_format(display_mouse_get_x(),0,8)+", "+string_format(display_mouse_get_y(),0,8));
draw_text(10,v_spacer*12,"WINDOW MX,MY: "+string_format(window_mouse_get_x(),0,8)+", "+string_format(window_mouse_get_y(),0,8));
draw_text(10,v_spacer*13,"CHUNKS LOADED: "+string_format(instance_number(objChunk),0,8));
//draw_text(10,v_spacer*14,"DO_UPDATE_NOW: "+string(objClock.do_update_now));
