///windowStep()
mouse_over=false;

if (isWindowHoverable(id))
    {
    mouse_over=mouseOverWindow(id);
    }

//mouse over only works if you're focused on (later, also "active")
//or you have megafocus

if (mouse_over==true)
    {
    windowMouseGetRelative(id);
    }
    
//and now time for window-specific actions

if (action_step!=noone)
    if (script_exists(action_step))
        {
        script_execute(action_step);
        }

