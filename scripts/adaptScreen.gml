///adaptScreen()
//now, let's make sure the app surface will take up
//all available pixelspace at the current resolution
//of your display. Remember, we're starting in
//FULLSCREEN mode!
view_wport[0]=display_get_width();
view_hport[0]=display_get_height();

if view_wport[0] != surface_get_width(application_surface) || view_hport[0] != surface_get_height(application_surface)
    {
    surface_resize(application_surface, view_wport[0],view_hport[0]);
    } //this is literally copy-pasted from the docs

display_set_gui_maximise();
//GUI should be the size of application surface

draw_enable_drawevent(1); //very important. otherwise the screen can get "stuck" if "game restart" or "room restart" gets invoked!
