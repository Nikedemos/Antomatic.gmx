with (argument[0])
{
//time_multiplier_calculated=timebase/sqrt(time_multiplier); //just for show, like "28 is twice as slow as normal"

var old_update_rate=update_rate;
var old_ratio=subticks/old_update_rate;

update_rate=power(timebase,slowmo_magnitude);

//should the update_rate be rounded off to nearest 1, to avoid
//fractional subticks mess?

//update_rate=round(update_rate);

ers=room_speed/update_rate;
linear_multiplier=ers/framebase;


//experimental: take the current subticks, divide over old_update_rate.
//that will tell you how far you are, subtick-wise, in the current tick.

//we'll try to bring the number of subticks as close as possible
//to the new update rate.

//WHY DO WE DO THIS?
//removes jerkiness of movement, makes motion blur look better

subticks=lerp(0,update_rate-1,old_ratio);
/*
//repeat last subtick
subticks--;
if (subticks<0) subticks=0;

subtickClock();
*/
}
