x=next_x;
y=next_y;

//an other things?
draw_x=12+x; //why 12? look at the ant's sprite origin!
draw_y=12+y; //cause, you know. no need to interpolate I guess?
is_busy=0;

//ok, nice. you just finished moving.
//look what's in front of you.
//another ant? ant's collider?
//currently just check for tunnels.

//for now, try with your current next_x and next_y,
//acorrding to your direction

//but first - the most important thing. is there a tunnel
//where you landed? if not, insta death. sorry. that's how things work
//in the antologic world
screenToGridRelative(x,y); //we get the return values in temp values

var gx=global.temp[0];
var gy=global.temp[1];

var my_cell=gridValueGetRelative(gx,gy,global.temp[2]);
if (my_cell==0)
{
antKill(id,DEATH_REASON_STUCK);
}
else
{
var maybe_next_x;
var maybe_next_y;

var tunnel_check=checkNeighbouringCell(t_direction);

maybe_next_x=global.temp[3];
maybe_next_y=global.temp[4];

//show_message(string(gx)+","+string(gy));
    
if (tunnel_check==true)
    {
    //nice. you can go there.

    next_x=maybe_next_x;
    next_y=maybe_next_y;
    next_t_direction=t_direction;
    //no change in direction
    }
else
    {
    //okay. pretend you're rotating counterclockwise +90, what about now?
    tunnel_check=checkNeighbouringCell(t_direction+90);

    maybe_next_x=global.temp[3];
    maybe_next_y=global.temp[4];
    
    if (tunnel_check==true)
        {
        //okay, you turn right now. instantly. call the police, I don't give a fuck.
        next_x=maybe_next_x;
        next_y=maybe_next_y;
        next_t_direction=t_direction+90; //cause that was the right direction        
        }
    else //no? well, what about counter-clockwise?
        {
        tunnel_check=checkNeighbouringCell(t_direction-90);

        maybe_next_x=global.temp[3];
        maybe_next_y=global.temp[4];
        
        if (tunnel_check==true)
            {
            next_x=maybe_next_x;
            next_y=maybe_next_y;
            next_t_direction=t_direction-90;
            //ok nice. counter-clockwise works.
            }
        else //but if it doesn't, try turning around.   
            {
            tunnel_check=checkNeighbouringCell(t_direction+180);

            maybe_next_x=global.temp[3];
            maybe_next_y=global.temp[4]
            
            if (tunnel_check==true)
                {
                next_x=maybe_next_x;
                next_y=maybe_next_y;
                next_t_direction=t_direction+180;            
                }
            else
                {
               // show_message("STUCK");
                }
            }
        }
    }

//set the next_x, next_y and next_direction now.


//if you're gonna rotate, rotate on your idle cycle.
//this will make movement smoother - since you don't
//stop and intersections.
}


//move your collider to the new spot
collider.x=next_x;
collider.y=next_y;
collider.direction=next_t_direction;
