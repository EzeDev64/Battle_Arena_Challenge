component_on_focus = undefined
client = instance_find(obj_client,0)

// ---------- Colores ----------
col_azul   = make_color_rgb(40, 130, 220);
col_azul_h = make_color_rgb(75, 160, 245);
col_texto  = make_color_rgb(200, 190, 230);
col_oro    = make_color_rgb(255, 205, 60);
col_plata  = make_color_rgb(200, 205, 218);
col_bronce = make_color_rgb(205, 130, 70);

// ---------- Posiciones [x1, y1, x2, y2] ----------
cx = room_width / 2;
panel       = [cx - 270, 35, cx + 270, 760];
panel_rank  = [cx - 340, 20, cx + 340, 655];

// Lobby
r_jugar   = [cx - 170, 215, cx + 170, 267];
r_ranking = [cx - 170, 285, cx + 170, 337];
r_demo    = [cx - 170, 355, cx + 170, 407];
r_salir   = [cx - 170, 455, cx + 170, 507];

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
	
	if _event == "jugar"{	
		client.play(room)
		return
	}
	
	if _event  == "close"{
		room_goto(Room_login)
		client.cerrar_sesion(Room_login)
		return
	}
	
	if _event  == "ranking"{
		room_goto(Room_globalRanking)
		client.globalRanking(Room_globalRanking)
		return
	}
}