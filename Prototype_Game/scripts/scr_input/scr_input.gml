function scr_input(){
		
	key_jump = keyboard_check_pressed(ord("Z"));
	key_punch = keyboard_check_pressed(ord("X"));
	key_dash = keyboard_check_pressed(ord("C")) or keyboard_check_pressed(vk_space);
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	
}