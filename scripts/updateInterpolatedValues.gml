draw_x = bound_clock.w_b*x+bound_clock.w_i*(x+t_hspeed);
var _g=0;
if (has_gravity==true)
    _g=bound_clock.g_acceleration;
draw_y = bound_clock.w_b*y+bound_clock.w_i*(y+t_vspeed+_g);

draw_ang = bound_clock.w_b*image_angle+bound_clock.w_i*(image_angle+t_aspeed);

//show_message("EY");
