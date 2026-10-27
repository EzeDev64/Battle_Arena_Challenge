draw_clear(make_color_rgb(30, 10, 50));

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_text(600, 120, "BATTLE ARENA CHALLENGE");
draw_text(600, 180, "LOBBY");

//Imprimir lista de jugadores
var _dy = 230
draw_text(600,200,$"Mi user:{global.user.username}")
var _client = instance_create_depth(0,0,1,obj_client)
//draw_text(0,15,$"Lista de usuarios conectados")
for (i = 0;i<array_length(_client.user_names);i++){
	draw_text(0,_dy,_client.user_names[i].username)
	_dy+=30
}

draw_text(600, 320, "Bienvenido al juego");
draw_text(600, 420, "Proximamente: modos de juego");

// Boton cerrar sesion
draw_set_color(make_color_rgb(40, 130, 220));
draw_roundrect_ext(450, 520, 750, 575,15,15, false);
draw_set_color(c_white);
draw_text(600, 547, "CERRAR SESION");

// Restaurar alineacion
draw_set_halign(fa_left);
draw_set_valign(fa_top);