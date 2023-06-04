/// @description Sistemas Do Player

#region Sistemas Basicos

key_jump = keyboard_check_pressed(ord("Z"));
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
	
var move = key_right - key_left;
	
//Aceleracao X
h_spd = h_spd + acc * move;
h_spd = clamp(h_spd, -spd, spd)
	
//Gravidade
v_spd = v_spd + grav;
v_spd = clamp(v_spd, -v_spd_max, v_spd_max);

if move = 0 {
	h_spd = lerp(h_spd, 0, dcc);
}

#endregion

#region Colisao
//X
if place_meeting(x + h_spd, y, obj_wall){
	while !place_meeting(x + sign(h_spd), y, obj_wall){
		x += sign(h_spd);
}
	h_spd = 0;
}
x += h_spd;

//Y
if place_meeting(x, y + v_spd, obj_wall){
	while !place_meeting(x, y + sign(v_spd), obj_wall){
		y += sign(v_spd);
	}
	v_spd = 0;
}
y += v_spd;
#endregion

#region Funcoes

//Jump
if key_jump {
	v_spd -= 8;
}
	
//Virar Sprite
if h_spd != 0 {
	image_xscale = sign(h_spd);
}

#endregion
	
