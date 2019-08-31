/*
global.camera_tick+=1;

if (global.camera_tick==room_speed/60 or global.camera_dragging=true)
    {
    global.camera_tick=0;
    draw_enable_drawevent(true);
    }
else  if (global.camera_tick==1) draw_enable_drawevent(false);
