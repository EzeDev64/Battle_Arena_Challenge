component_on_focus = undefined
client = instance_find(obj_client,0)

// Datos del jugador actual (de ejemplo) y su posicion segun el ranking
mi_puntos = 1250;
mi_victorias = 4;
mi_pos = 1;
/*
for (var i = 0; i < array_length(global.globalRanking); i++) {
    if (global.globalRanking[i].puntos > mi_puntos) mi_pos += 1;
}
*/


// ---------- Colores ----------
col_azul   = make_color_rgb(40, 130, 220);
col_azul_h = make_color_rgb(75, 160, 245);
col_texto  = make_color_rgb(200, 190, 230);
col_oro    = make_color_rgb(255, 205, 60);
col_plata  = make_color_rgb(200, 205, 218);
col_bronce = make_color_rgb(205, 130, 70);

// ---------- Posiciones [x1, y1, x2, y2] ----------
cx = room_width / 2;
panel       = [cx - 270, 35, cx + 270, 640];
panel_rank  = [cx - 340, 20, cx + 340, 760];

// Lobby
r_jugar   = [cx - 170, 215, cx + 170, 267];
r_ranking = [cx - 170, 285, cx + 170, 337];
r_demo    = [cx - 170, 355, cx + 170, 407];
r_salir   = [cx - 170, 455, cx + 170, 507];

// Ranking
r_atras   = [cx - 150, 590, cx + 150, 638];

// Ganador
r_g_lobby = [cx - 280, 582, cx - 20, 630];
r_g_otra  = [cx + 20, 582, cx + 280, 630];

function notify(_compID= undefined, _event="", _data={}){
	if _compID==undefined{
		show_debug_message("Ningun evento fue enviado")
		show_debug_log(true)
		return
	}
	
	if _event == "focus"{
		if component_on_focus != undefined{
			variable_instance_set(component_on_focus,"focus",false)
		}
		
		if (variable_instance_exists(_compID, "focus")){
			variable_instance_set(_compID,"focus",true)
			component_on_focus = _compID
		}
		return
	}
	
	if _event  == "close"{
		colyseus_room_leave(room);
		room_goto(Room_lobby)
		return
	}
}