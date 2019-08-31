/*
if (ds_list_size(ghost_angle)>max_ghosts)
    {
    //remove extra ghosts
    
    do
    {
    ds_list_delete(ghost_x,0);
    ds_list_delete(ghost_y,0);
    ds_list_delete(ghost_angle,0);
    ///ds_list_delete(ghost_t_hspeed,0);
    ///ds_list_delete(ghost_t_vspeed,0);
    ///ds_list_delete(ghost_t_aspeed,0);
    }
    until (ds_list_size(ghost_angle)==max_ghosts);
    
    }

ds_list_add(ghost_x,draw_x);
ds_list_add(ghost_y,draw_y);
ds_list_add(ghost_angle,draw_ang);

///ds_list_add(ghost_t_hspeed,t_hspeed);
///ds_list_add(ghost_t_vspeed,t_vspeed);
///ds_list_add(ghost_t_aspeed,t_aspeed);

