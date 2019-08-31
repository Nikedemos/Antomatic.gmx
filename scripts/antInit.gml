//show_message("HI IM A ANT");
has_gravity=false;

//okay.
//so, ants have their x and y stored - that's their current x.
//they also have a direction.
//and most imporantly, cycle settings:
/*
*/
cycles_busy = bound_clock.framebase/16; //it will take a second to advance to the next tile
cycles_idle = bound_clock.framebase/16; //you will also wait 1 second

cycle_counter=bound_clock.ticks mod (cycles_busy+cycles_idle);

//because we're going right by default
next_x=x;
next_y=y;
next_t_direction=t_direction;

collider=instance_create(next_x,next_y,objAntCollider);
collider.owner=id;
collider.image_blend=c_green;

draw_x=12+x; //12 cause look a the sprite origin.
draw_y=12+y;

//now decide - are you in the busy, or idle cycles?
is_busy=cycle_counter<cycles_busy;

