draw_set_font(fntMedium);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var v_spacer=20;

draw_text(10,v_spacer,"SLOWMO MAGNITUDE: "+string_format(objClock.slowmo_magnitude,0,4));
draw_text(10,v_spacer*2,"UPDATE RATE: "+string_format(objClock.update_rate,0,4));
draw_text(10,v_spacer*3,"LINEAR MULTIPLIER: "+string_format(objClock.linear_multiplier,0,4));
draw_text(10,v_spacer*4,"ERS (EQUIVALENT ROOM SPEED): "+string_format(objClock.ers,0,8));
draw_text(10,v_spacer*5,"ACTUAL FPS: "+string_format(fps,0,0)+"/"+string_format(room_speed,0,0));


