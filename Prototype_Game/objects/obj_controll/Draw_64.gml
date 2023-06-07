draw_set_font(dev);

draw_text_scribble(_xx, _yy, "PLAY [spr_play]");
draw_text_scribble(_xx, _yy * 7, string(obj_player.state));
draw_text_scribble(_xx, _yy * 8, "Dash: "+string(obj_player.dash_cooldown = 90 ? "Pronto": "Em recarga"));
draw_text_scribble(_xx, _yy * 9, string(obj_player.in_wall ? "Na Parede": "Fora da Parede"));



draw_text(_xx, _yy * 20, "SP");

