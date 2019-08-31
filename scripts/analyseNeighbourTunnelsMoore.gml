///analyseNeighbourTunnelsVonNeumann(middle_cell_screen_x,middle_cell_screen_y)
//this will return a number between 0 and 512
//the most significant bit is you
//and then, followed by your 8 neighbours


var ret_value=0;

//that's where you clicked on, it doesn't change, we get the grid_x and grid_y that we can manipulate


var grid_x,grid_y;
screenToGridRelative(argument[0],argument[1]);

grid_x=global.temp[0];
grid_y=global.temp[1];

//do some binary bitshifting and adding
//without using binary operators
//and while operating on the decimal number system
//neat, huh

ret_value+=gridValueGetRelative(grid_x+1,grid_y,global.temp[2]); //right
ret_value+=2*gridValueGetRelative(grid_x+1,grid_y-1,global.temp[2]); //right-top
ret_value+=4*gridValueGetRelative(grid_x,grid_y-1,global.temp[2]); //top
ret_value+=8*gridValueGetRelative(grid_x-1,grid_y-1,global.temp[2]); //top-left
ret_value+=16*gridValueGetRelative(grid_x-1,grid_y,global.temp[2]); //left
ret_value+=32*gridValueGetRelative(grid_x-1,grid_y+1,global.temp[2]); //left-bottom
ret_value+=64*gridValueGetRelative(grid_x,grid_y+1,global.temp[2]); //bottom
ret_value+=128*gridValueGetRelative(grid_x+1,grid_y+1,global.temp[2]); //bottom-right
//and yourself
ret_value+=256*gridValueGetRelative(grid_x,grid_y,global.temp[2]);

return ret_value;
