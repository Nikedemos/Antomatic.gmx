///is_object_in_view(object)

obj=argument[0];
return (obj.bbox_right>view_xview[0]-1 && obj.bbox_left<view_xview[0]+view_wview[0] && obj.bbox_bottom>view_yview[0] && obj.bbox_top<view_yview[0]+view_hview[0]);

