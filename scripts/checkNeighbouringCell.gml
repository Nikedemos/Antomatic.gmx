///checkNeighbouringCell(direction)

lengthdirButBetter(x,y,global.cell_size,argument[0]);
/*
maybe_next_x=global.temp[3];
maybe_next_y=global.temp[4]; //that needs to be done after the script!

*/

//great! What's over there, a nice tunnel to go to?
screenToGridRelative(global.temp[3],global.temp[4]); //we get the return values in temp values

var gx=global.temp[0];
var gy=global.temp[1];

return gridValueGetRelative(gx,gy,global.temp[2]);
