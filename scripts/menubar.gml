window_x=0;
window_y=0;

window_width=GUI_RIGHT;
window_height=32;

controls=false;
draggable=false;
resizeable=false;
border=false;
megafocus=true;

depth=global.gui_megafocus_starts_at;

action_draw=menubar_draw;
action_step=menubar_step;


//initiate some datastructures
//menu will be permanent, so don't worry about destroying it afterwards
/*
children, has_children, is_separator, enabled, visible, text, icon, shortcut, action_script
*/

main_menu=ds_grid_create(9,1);
ds_grid_clear(main_menu,0);

menu_file=menuGridAddInto(main_menu,0,1,1,"File",noone,noone,noone);
menu_edit=menuGridAddInto(main_menu,0,1,1,"Edit",noone,noone,noone);
menu_view=menuGridAddInto(main_menu,0,1,1,"View",noone,noone,noone);

//calculate the total clickable menu width, based on the top-level elements
//and drawing them on screen with current settings (which are, as of now, hard-coded)


top_level_hover_curr=noone;
top_level_hover_prev=noone;

in_menu=false;
