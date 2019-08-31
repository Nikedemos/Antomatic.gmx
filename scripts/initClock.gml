//when running room at 5040 fps:
//global.update_rate=84; //5040/84=60 for the look of 60fps

//when running room at 840 fps (5040/6)

ticks=0; //"full" cycles
subticks=0; //"where" in the cycle you are
do_update_now=false; //instances might check this
playing=false; //is the clock updating?

g_acceleration=0.75; //gravity

//if the room is running at 840 fps, dividing over this value will give us roughly 60 fps
framebase=16; //what should be considered the "normal", 1x speed of ticks per second
timebase=room_speed/framebase;

slowmo_magnitude=1; //goes from 0 (fastest possible) to infinity (inifinitely slow, up to the user)
ers=0;
update_rate=0;
linear_multiplier=1;  //calculated speed multiplier, where 60 ERS (Equivalent Room Speed) = 1, 120 ERS = 2, 30 ERS = 0.5 etc
timeshift_step=0.01; //for controlling the time_multiplier, how much you add/subtract with each mouse wheel (up/down)

w_i = 0; //weight interpolated
w_b = 0; //weight basic

ghost_type=GHOSTS_ALPHA_SAME;

//will be calculated based on slowmo_magnitude
recalculateUpdateRate(id);

//now, assuming the clock is stopped, we need to do one more thing:
//set up an alarm for the next tick, check what instances are bound to the clock,
//and make them perform a subtick update. this will calculate their
//initial position on screen.

//on a side note, if you want clock-dependant alarms, use the t_alarms script family
//on a Ticker object.

alarm[0]=1; //next step, do PostInit

