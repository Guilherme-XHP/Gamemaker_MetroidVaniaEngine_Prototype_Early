draw_set_font(dev);

draw_text_scribble(_xx, _yy, "PLAY [spr_play]");
draw_text_scribble(_xx, _yy * 4, string(obj_player.state_dir));
draw_text_scribble(_xx, _yy * 5, string(obj_player.state));
if instance_exists(obj_enemy){
	draw_text_scribble(_xx, _yy * 6, string(obj_enemy.state));
}
draw_text_scribble(_xx, _yy * 7, string(obj_player.dash_cooldown));

draw_text_scribble(_xx, _yy * 8, "P_ACT " + string(obj_player.perry_isDispo));
draw_text_scribble(_xx, _yy * 9, "P_TIME " + string(obj_player.perry_time));

draw_text_scribble(_xx, _yy * 10, string(obj_player.key));
draw_text_scribble(_xx, _yy * 11, string(snd_walk_timer));





draw_text(_xx, _yy * 20, "SP");

