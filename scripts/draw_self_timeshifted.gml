{

//NO GHOSTS FOR NOW
/*
var ghost_count=ds_list_size(ghost_angle);

if (ghost_count>0)
{
for (var g=0; g<ghost_count; g+=1)
    {
    var d_x=ghost_x[| g];//w_b*ghost_x[| g]+w_i*(ghost_x[| g]+ghost_t_hspeed[| g]);
    var d_y=ghost_y[| g];//w_b*ghost_y[| g]+w_i*(ghost_y[| g]+ghost_t_vspeed[| g]);
    var d_a=ghost_angle[| g];//w_b*ghost_angle[| g]+w_i*(ghost_angle[| g]+ghost_t_aspeed[| g])
    
    var d_alpha=0;
    
    switch (bound_clock.ghost_type)
        {
        case GHOSTS_ALPHA_SAME: d_alpha=(1/(ghost_count))*3; break;
        case GHOSTS_ALPHA_LINEAR: d_alpha=g/ghost_count; break;
        case GHOSTS_ALPHA_ZIPF: d_alpha=1/(ghost_count-g);
        }
    
    draw_sprite_ext(sprite_index,image_index,d_x,d_y,image_xscale,image_yscale,d_a,image_blend,d_alpha);
    }
}

//let's take weighted average of the current and next x,y.
//if the body has gravity, also take that gravity into account!
if (bound_clock.ghost_type!=GHOSTS_ALPHA_SAME)
*/

draw_sprite_ext(sprite_index,image_index,draw_x,draw_y,image_xscale,image_yscale,draw_ang,image_blend,image_alpha);

}


