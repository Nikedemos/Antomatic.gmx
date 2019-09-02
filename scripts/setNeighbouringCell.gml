///setNeighbouringCell(direction,value)
//this function calls some painting functions
//basically,

lengthdirButBetter(x,y,global.cell_size,argument[0]);

//great! What's over there, a nice tunnel to go to?
screenToGridRelative(global.temp[3],global.temp[4]); //we get the return values in temp values

var gx=global.temp[0];
var gy=global.temp[1];

//first, check the value. if it's the same, no need to do anything

if (gridValueGetRelative(gx,gy,global.temp[2])!=argument[1])
    {
    gridValueSetRelative(gx,gy,global.temp[2],argument[1]);
    
    }
