///menuGridAddInto(grid,is_separator,enabled,visible,text,icon,shortcut,action_script)
//adding is permanent, if you wanna hide it - well, hide it, or disable it

//as always, silly names so we don't confuse them
//with "proper" variables

var griddy=argument[0];
var is_separator=argument[1];
var enabley=argument[2];
var visibley=argument[3];
var textey=argument[4];
var iconey=argument[5];
var shortcutey=argument[6];
var scriptey=argument[7];

//now, when the grid is created, it has the height of 1.
//no need to resize it during that first step.
var go_ahead_and_resize=true;
var currently_records=0;

var zeroth=griddy[# 0, 0];
var first_subgrid_exists=(zeroth!=0);


if (!first_subgrid_exists)
    {
    go_ahead_and_resize=false;
    }
else //that means we put at least 1 record there
    {
    currently_records=ds_grid_height(griddy);
    }

//resize the grid
if (go_ahead_and_resize==true)
    {
    ds_grid_resize(griddy,9,currently_records+1);
    }

//and insert that value
//create the new subgrid... and populate the rest of the values there
griddy[# 0, currently_records] = ds_grid_create(9,1); //same
ds_grid_clear(griddy[# 0, currently_records],0);

griddy[# 1, currently_records] = -1; //well, we don't know if they have children...
griddy[# 2, currently_records] = is_separator;
griddy[# 3, currently_records] = enabley;
griddy[# 4, currently_records] = visibley;
griddy[# 5, currently_records] = textey;
griddy[# 6, currently_records] = iconey;
griddy[# 7, currently_records] = shortcutey;
griddy[# 8, currently_records] = scriptey;


return griddy[# 0, currently_records]; //returns the sugrid for that item
