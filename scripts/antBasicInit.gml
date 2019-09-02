draw_x=12+x; //12 cause look a the sprite origin.
draw_y=12+y;

//INDIVIDUALISTIC VARIABLES
//THEY NEED TO BE SAVED/LOADED
//ONLY DEFAULTS SHOULD BE DEFINED HERE

next_x=x;
next_y=y;
next_t_direction=t_direction; //should be 0

collider=instance_create(next_x,next_y,objAntCollider);
collider.owner=id;
collider.image_blend=c_green;

cycle_busy_ticks=1; //will take 1 s
cycle_idle_ticks=1;

cycle_tick_offset=0;

cycle_counter=0;

is_busy=true; //we start from busy, but w/e, it's gonna get changed as soon as updating subtick happens

//for busy ticks 1 and idle 1, busy cycle will start at:
//bound_clocks.ticks+cycle_tick_offset mod (cycle_busy_ticks+cycle_idle_ticks)
//so you have another ant with same busy/idle cycle, but offset 1,
//they will alternate their movement/stoppage. neat huh



