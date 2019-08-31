//okay. is it time to update your position?
if (bound_clock.do_update_now==true)
    {
    //is it affected by gravity? if so, add to vspeed
    if (has_gravity==true)
    {
    t_vspeed+=bound_clock.g_acceleration;
    
    //limit vspeed
    if (t_vspeed_max!=0)
        t_vspeed=min(t_vspeed,t_vspeed_max);
    
    if (t_vspeed_min!=0)
        t_vspeed=max(t_vspeed,t_vspeed_min);
    }    
    
    x+=t_hspeed;
    y+=t_vspeed;
    image_angle+=t_aspeed;
    }

updateInterpolatedValues();
