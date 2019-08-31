///tAlarmSetup(object,alarm_id_0_to_12,script);
var _obj=argument[0];
var _al=argument[1];
var _scr=argument[2];

with (_obj)
    {
    //you should first check if it's, indeed, a time-enabled object.
    //for now, let's just assume that it is, k?
    t_alarm[# _al, T_ALARM_SCRIPT] = _scr;
    }
