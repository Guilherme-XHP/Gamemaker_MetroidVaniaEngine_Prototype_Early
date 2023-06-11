draw_set_font(dev);
draw_text_scribble(_xx, _yy * 1, string(obj_player.state));
draw_text_scribble(_xx, _yy * 2, "Dash: "+string(obj_player.dash_cooldown = 90 ? "Pronto": "Em recarga"));
draw_text_scribble(_xx, _yy * 3, string(obj_player.in_wall ? "Na Parede": "Fora da Parede"));
draw_text_scribble(_xx, _yy * 4, string(system));