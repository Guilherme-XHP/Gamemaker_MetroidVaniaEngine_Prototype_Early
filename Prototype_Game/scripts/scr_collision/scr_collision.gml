function scr_collision(){
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