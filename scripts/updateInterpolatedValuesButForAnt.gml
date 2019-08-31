if (is_busy==true)
{
var w_c=cycle_counter/cycles_busy;
var w_d=0;
//w_d=(global.cell_size/cycles_busy)*bound_clock.w_i;
//for extra precision

draw_x=12+lerp(x,next_x,w_c);//+(x!=next_x)*w_d;
draw_y=12+lerp(y,next_y,w_c);//+(y!=next_y)*w_d;
draw_ang=t_direction;
}
else
{
var w_c=(cycle_counter-cycles_busy)/cycles_idle;
draw_ang=lerp(t_direction,next_t_direction,w_c);
}
/*
draw_x = bound_clock.w_b*x+bound_clock.w_i*(x+t_hspeed);
var _g=0;
if (has_gravity==true)
    _g=bound_clock.g_acceleration;
draw_y = bound_clock.w_b*y+bound_clock.w_i*(y+t_vspeed+_g);

draw_ang = bound_clock.w_b*image_angle+bound_clock.w_i*(image_angle+t_aspeed);

