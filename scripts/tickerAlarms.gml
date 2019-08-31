//iterate through all the alarms.
//if the value is 0 and do_trigger_now==true,
//don't decrease it any further, just do_trigger_now=false.

//again, only when it's the update tick
if (bound_clock.do_update_now==true)
{
for (var _alz=0; _alz<12; _alz++)
{
//skip alarms without scripts assigned
if (t_alarm[# _alz, T_ALARM_SCRIPT]!=-1)
    {
    if (t_alarm[# _alz, T_ALARM_VALUE]>0)
        {
        t_alarm[# _alz, T_ALARM_VALUE]--;
        
        //if it's 0 now, let it know it should trigger next update
        t_alarm[# _alz, T_ALARM_TRIGGER_NOW]=true;        
        }
    else //we reached the end. 
        {
        if (t_alarm[# _alz, T_ALARM_TRIGGER_NOW]==true)
            {
            script_execute(t_alarm[# _alz, T_ALARM_SCRIPT]);
            //just so we don't fire it off ad nauseam, turn it of now
            t_alarm[# _alz, T_ALARM_TRIGGER_NOW]=false;  
            }
        }
    }
}

}
