//draw the topmost elements (File, Edit etc...)

var mainmenu_records=ds_grid_height(main_menu);

draw_set_font(fntMedium);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_white);
    
for (var d=0; d<mainmenu_records; d++)
    {
    var textu=main_menu[# 5, d];
    
    draw_text(d*128,4,textu);
    }
