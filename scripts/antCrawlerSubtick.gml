if (bound_clock.do_update_now==1)
    {
    if (is_busy)
        {
        if (cycle_counter==cycle_busy_ticks) //end your busy cycle
            {
            antCrawlerPlanNextMove();
            }
        else if (cycle_counter==0) //do the "busy cycle" thing you do once
            {
            }
            
        //you're busy, that means you're moving    
        }
        
    cycle_counter++;
        
    if (cycle_counter==(cycle_busy_ticks+cycle_idle_ticks))
        {
        cycle_counter=0;
        is_busy=1;
        
        setTDirectionAndAngle(modulo_euclidian(next_t_direction,360));
        }
    }
    
if (bound_clock.playing==true)
antBasicUpdateDrawValues();
