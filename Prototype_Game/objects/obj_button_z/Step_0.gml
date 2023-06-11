if clicked = false{
	image_index = 0;
}else{
	image_index = 1;
}


hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if (hovering && mouse_check_button_pressed(mb_left)) 
{
	clicked = true;
	keyboard_key_press(ord("Z"));
} 

if (mouse_check_button_released(mb_left)) 
{
	clicked = false;
} 

