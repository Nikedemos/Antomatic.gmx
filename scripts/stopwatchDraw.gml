draw_set_font(fntCursedTimerFromFontspaceDotCom);
draw_set_color(c_lime);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
//draw_text(room_width-12,12,string_format(bound_clock.ticks+bound_clock.subticks,10,10));

var cur_x=view_wport[0]-12;

draw_text(cur_x,12,zerofill_before(string(h),3)+":"+zerofill_before(string(m),2)+":"+zerofill_before(string(s),2)+":"+zerofill_before(string(total_ticks),2)+":"+zerofill_before(string_format(bound_clock.subticks,1,4),4)+"/"+zerofill_before(string_format(bound_clock.update_rate,1,4),4));
