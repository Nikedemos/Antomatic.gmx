if (is_busy==true)
{
var w_c=cycle_counter/cycle_busy_ticks;
var w_d=0;
//w_d=(global.cell_size/cycles_busy)*bound_clock.w_i;
//for extra precision

draw_x=12+lerp(x,next_x,w_c);//+(x!=next_x)*w_d;
draw_y=12+lerp(y,next_y,w_c);//+(y!=next_y)*w_d;
draw_ang=t_direction;
}
else
{
var w_c=(cycle_counter-cycle_busy_ticks)/cycle_idle_ticks;
draw_ang=lerp(t_direction,next_t_direction,w_c);
}

