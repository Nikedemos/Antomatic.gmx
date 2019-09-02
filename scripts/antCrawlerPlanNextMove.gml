x=next_x;
y=next_y;
t_direction=modulo_euclidian(next_t_direction,360);

//an other things?
draw_x=12+x; //why 12? look at the ant's sprite origin!
draw_y=12+y; //cause, you know. no need to interpolate I guess?
is_busy=0;

//ok, nice. you just finished moving to the new spot.

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
else //oh okay it's fine apparently, we're in a tunnel.
{
//analyse your neighbourhood.
//first, get the moore value:

var neighbourhood_value=analyseNeighbourTunnelsMoore(x,y) & 255;

if (neighbourhood_value>255)
    show_message("IT HAPPENS HERE!");

//we know that the self-value is 0, so the number will not exceed 255.
//now, we take that number, and circularShift it so it matches your rotation
//(if the rotation is not 0)

//if (t_direction!=0)
    {
    neighbourhood_value=circularShiftByte(neighbourhood_value,(t_direction/90)*(-2));
    //wait, what? how did you get the second argument?
    //simple. if the direction is 90 (up), it will shift -2 (2 to the right).
    //now it will treat that neighbourhood value as if everything was rotated
    //right (direction 0).
    //so the rules treat the "right" rotation as "in front of the ant's direction movement"
    if (neighbourhood_value>255)
    show_message("BUT ALSO HERE!");
    }

    
//otherwise just leave it as it is - it's already right. so we save 25% computation time, on average.

//now, take that neighbourhood value and use it as the buffer offset. we take the value of that byte
//at the offset and analyse them bits by bits.




//buffer_seek(terrain_rules,buffer_seek_start,neighbourhood_value);

var rules=buffer_peek(terrain_rules,neighbourhood_value,buffer_u8);

/*
Action A, defines your orientation change (3 bits):
ROTATE_0 (basically, don't rotate)
ROTATE_COUNTERCLOCKWISE
ROTATE_CLOCKWISE
ROTATE_AROUND

Action B, defines tunneling (3 bits):
NOTHING
DIG_OR_TAKE_IN_FRONT //digs if there's no tunnel in front, otherwise, if you're not carrying anything, and something's there to pick up, pick it up.
BURY_OR_PUTDOWN_IN_FRONT //buries tunnel if there is one in front, otherwise, if you're carrying something, and there's nothing else there, put it down
UNUSED

Action C, whether we move forward or not after ROTATING/TUNNELING (1 bit):
NOTHING
MOVE_FORWARD

Wwhether rotate first or tunnel first (1 bit):
ROTATE_FIRST
TUNNEL_FIRST
*/

//bitmask the first 3 bits to get next orientation
var action_a,action_b,action_c;

action_a=rules & 7; //AND for first 3 bits
action_b=(rules >> 3) & 7; //AND for the next 3 bits
action_c=(rules >> 6) & 1;
action_a_before_b=(rules >> 7) & 1;

var tunnel_in_front=-1;

var direction_to_use=-1;

//so basically, since rotating and digging/burying happens at the same time,
//we need to decide which cell treat as the "in front of you" cell.


//we give it next_t_direction RELATIVELY!
//as in, add the action_a*90 value to it.

next_t_direction=modulo_euclidian(next_t_direction+action_a*90,360);

if (action_a_before_b)
    {
    direction_to_use=next_t_direction;
    }
else
    {
    direction_to_use=t_direction;
    }

    
    if (action_b!=0) //because 0 means NOTHING
        {
        tunnel_in_front=checkNeighbouringCell(direction_to_use);
        
        //now consider 3 cases: take, give, and toggle (currently not implemented)
        switch (action_b)
            {
            case 1: //digging/taking stuff. for now, only digging
                {
                if (!tunnel_in_front)
                    {
                    //global.temp[3] and global.temp[4] will hold the x,y of the tunnel_in_front from the checkNieghbouringCell procedure!
                    //handy. now, the tunnel ain't gonna dig itself.
                    toggleCellAtScreen(global.temp[3],global.temp[4]);
                    }
                } break;
            case 2: //burying/putting down stuff. for now, only burying
                {
                if (tunnel_in_front)
                    {
                    toggleCellAtScreen(global.temp[3],global.temp[4]);
                    }
                } break;
            }
        }


//now check whether we move forward in the new (or old?) direction - or not
if (action_c)
    {
    //move forward - if there's nothing in front! this time we're using next_t_direction
    tunnel_in_front=checkNeighbouringCell(next_t_direction);
    
    if (tunnel_in_front)
        {
        //we use global.temp[3] and global.temp[4] to get the screen x and y
        //that we now assign to the next_x and next_y. DONE!
        
        next_x=global.temp[3];
        next_y=global.temp[4];
        }
    }
}   
