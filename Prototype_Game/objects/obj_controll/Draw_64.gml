draw_set_font(dev);

draw_text_scribble(_xx, _yy, "PLAY [spr_play]");
draw_text_scribble(_xx, _yy * 2, string(obj_player.speed));
draw_text_scribble(_xx, _yy * 3, string(obj_player.state_dir));
draw_text_scribble(_xx, _yy * 4, string(obj_player.state));
if instance_exists(obj_enemy){
	draw_text_scribble(_xx, _yy * 5, string(obj_enemy.state));
}
draw_text_scribble(_xx, _yy * 6, string(obj_player.dash_cooldown));
draw_text_scribble(_xx, _yy * 7, string(obj_player.h_spd));
draw_text_scribble(_xx, _yy * 8, string(obj_player.spd));





draw_text(_xx, _yy * 20, "SP");

