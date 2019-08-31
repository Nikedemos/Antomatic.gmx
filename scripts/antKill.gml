///antKill(id,REASON_CONST)

with (argument[0])
    {
    collider.alarm[0]=1; //1 subtick delay, that's fine, apparently, we can't do
    //two nested with statements. I'm dissapointed, but not surprised.
    
    //now delete all the data structures and dynamic stuff from memory, k    
        
    instance_destroy();
    }
