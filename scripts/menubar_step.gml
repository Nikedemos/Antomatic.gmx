//hover tells us whether mouse is hovering over one of the top-level
//elements - and which one.

if (mouse_over==1)
    {
    var calc_grid_index;
    
    //mouse_over_x might go over the calculated, clickable menu area.
    //in that case, don't cancel the current scrolldown windows
    //and don't change the current top_level_hovers.
    
    //based on mouse_over_x, determine top_level_hover
    top_level_hover_prev=top_level_hover_curr;
    top_level_hover_curr=calc_grid_index;
    }
    
//top_level_hover will be the highlighte
