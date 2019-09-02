//we're not calling the event.
//we're not doing default ticker stuff,
//ants have no vanilla physics to emulate
//with the t_* variable system.
/*
if (bound_clock.do_update_now==true)
{
//this is where you make your "draw_x, draw_y" things

if (is_busy)
    {
    if (cycle_counter==cycles_busy) //end your busy cycle
        {
        planNextMove();
        }
    else if (cycle_counter==0) //do the "busy cycle" thing you do once
        {
        antBusyOnce();
        }
        
    //you're busy, that means you're moving    
    }

cycle_counter++;
    
if (cycle_counter==(cycles_busy+cycles_idle))
    {
    cycle_counter=0;
    is_busy=1;
    
    setTDirectionAndAngle(modulo_euclidian(next_t_direction,360));
    }
}
//if (is_busy==true && is_waiting==false) //because if you're not moving, why bother with that?
updateInterpolatedValuesButForAnt();
