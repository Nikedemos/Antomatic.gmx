//tickers move without using vspeed/hspeed/speed/direction.
//this is because their position doesn't get updated every step,
//but only when global.do_update_now=true.
//that also goes for collision checkings.
//don't use vanilla collision event, unless you
//know it's update time!

//some fake alarms in a grid

t_alarm=ds_grid_create(12,5);

bound_clock=instance_nearest(x,y,objClock); //try to bind to the nearest clock

//12 alarms numbered 0 - 11, each has:
// - alarm value, that goes down 1 every tick update,
//   but when it gets to 0, it stops there and gets triggered.
// - alarm script, default:-1
// - do_trigger_now, default: false

for (var a=0; a<12; a++) //iterate through columns
    {
    t_alarm[# a, T_ALARM_VALUE] = 0;
    t_alarm[# a, T_ALARM_SCRIPT] = -1;
    t_alarm[# a, T_ALARM_TRIGGER_NOW] = false;
    }

//how do you setup trigger alarms?


has_gravity=false;
t_vspeed_min=-32; //0 meaning no limit here
t_vspeed_max=32;

t_speed_min=0;
t_speed_max=4;

max_ghosts=28;

draw_x=0;
draw_y=0;
draw_ang=0;

t_hspeed=0;
t_vspeed=0;
t_speed=0;
t_direction=0;
t_aspeed=0; //angular speed, who knows, you might need it for image_angle or sth?
t_image_index=0;
t_image_speed=0;

//NO GHOSTS FOR NOW!
//max_ghosts=16; //or, better yet, based on 5040-update_rate
/*
ghost_x=ds_list_create();
ghost_y=ds_list_create();
ghost_angle=ds_list_create();

ghost_t_hspeed=ds_list_create();
ghost_t_vspeed=ds_list_create();
ghost_t_aspeed=ds_list_create();
*/

//remember to destroy those lists at instance_destroy / room_restart

