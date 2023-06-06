function scr_enemy_collision(){
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
}
	
function scr_enemy_sys(){
	
	v_spd = v_spd + grav;
	v_spd = clamp(v_spd, -v_spd_max, v_spd_max);
	
	scr_enemy_collision();
	
	if state = "hit"{
	
	}
	
}
	