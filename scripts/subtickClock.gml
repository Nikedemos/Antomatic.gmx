if (playing==true)
{
do_update_now=false;

subticks++;

if (subticks>=update_rate)
    {
    subticks-=update_rate;
    ticks++;
    
    do_update_now=true;
    }
calculateWandI(); //this will calculate interpolation and counter-interpolation
//of subticks between ticks
}
else
{
do_update_now=false;
}
