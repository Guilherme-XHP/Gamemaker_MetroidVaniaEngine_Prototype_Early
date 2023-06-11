var _max_devices = 4;

for (var i = 0; i < _max_devices; i++){
	var _mouse_x = device_mouse_x_to_gui(i);
	var _mouse_y = device_mouse_y_to_gui(i);
	
	var _ui_at_pos = instance_position(_mouse_x, _mouse_y, obj_ui_parent);
	var _held = device_mouse_check_button(i, mb_left);
	
	if (_ui_at_pos != noone && _held){
		_ui_at_pos.input(i, _mouse_x, _mouse_y);
	}
}

if os_type = os_android or os_windows or os_gxgames{
    system = "Mobile"
}/*
else if os_type = os_gxgames{
    system = "Desktop"
}
*/

if system = "Mobile"{
	layer_set_visible("UI_MOBILE", true);	
}else{
	instance_deactivate_layer("UI_MOBILE");
}