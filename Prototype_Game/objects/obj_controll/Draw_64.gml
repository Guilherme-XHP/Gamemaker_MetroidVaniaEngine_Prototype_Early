draw_set_font(dev);

draw_text_scribble(_xx, _yy, "PLAY [spr_play]");
draw_text_scribble(_xx, _yy * 7, string(obj_player.state));
draw_text_scribble(_xx, _yy * 8, string(obj_player.dash_cooldown));






draw_text(_xx, _yy * 20, "SP");

