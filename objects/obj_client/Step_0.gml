if (client == 0) {
    if (!colyseus_is_ready()) exit;
	//Correr de forma local
    //client = colyseus_client_create("ws://192.168.100.97:2567");
	//Correr desde el server en Azure
	client = colyseus_client_create("wss://game-server.bravecliff-735637dc.brazilsouth.azurecontainerapps.io");
    net_room = colyseus_client_join_or_create(client, room_get_name(room), {});
}

colyseus_on_message(net_room, method(id, function(_room, _type, _data) {
	#region //Login and sign-in
	
	//Cuando acepta la cola y te tira a la partida
	if (_type=="seat"){
		colyseus_room_leave(_room);
		show_debug_message("¡La cola se completó! Saliendo de la queue...");
		room_goto(Room1);
		var _options = "{ \"username\": \""+global.user+"\"}";
		net_room = colyseus_client_join_or_create(client, "Room1", _options)
	}
	
	if (_type == "change_room") {
		global.user = _data.username
		colyseus_room_leave(_room);
		actual_room = _data.rm
		var _options = "{ \"username\": \""+global.user+"\"}";
		net_room = colyseus_client_join_or_create(client, _data.rm, _options)
		room_goto(Room1)
	}
	
	if (_type=="login succesfully"){
		show_message("Inicio de sesión exitoso")
		show_debug_message("En cola, esperando una partida...")
		global.user = _data.username
		//global.user = "Eze"
		var _options = "{ \"username\": \""+global.user+"\"}";
		colyseus_room_leave(_room);
		net_room = colyseus_client_join_or_create(client, "queue", _options);
		
	}
	
	//Al recibir el código para la verificación.
	if (_type =="codesend"){
		//Habilitar todos los campos del código para escribirlo
	}
	
	if (_type =="passwordChange"){
		show_message("Contraseña cambiada")
		instance_find(obj_IGU_mediator,0).notify(id,"volver");
	}
	#endregion
	
	#region //Game
	if (_type == "game_start") {
		define_spawns()
		instance_find(obj_player,0).move_enabled = true
		var _item = instance_create_layer(global.spawn_lst[0].x,global.spawn_lst[0].y,"Instances",obj_item)
	}
	
	if (_type == "game_end") {
		var _parsed_data = is_string(_data) ? json_parse(_data) : _data;
		show_debug_message("Ranking recibido: " + json_stringify(_parsed_data))
		global.ranking = _parsed_data.ranking
		show_debug_message(global.ranking)
		colyseus_room_leave(_room);
		room_goto(Room_ranking)
	}

	//Cuando un usuario que no es el actual jugador se conecta
	if (_type == "player_connected") {
		if (_data.username != global.user){
			//show_message("Jugador conectado");
			var _npc = instance_create_layer(100,100,"Instances",obj_npc)
			_npc.username = _data.username
			array_push(user_names,_npc)
			_npc.x = _data.x
			_npc.y = _data.y
		}
	}
	
	//Define la posición de inicio del jugador al conectarse
	if (_type == "player_init_position"){
		show_debug_message("Coordenadas enviadas");
		var _player = instance_create_layer(100,100,"Instances",obj_player)
		_player.x = _data.x
		_player.y = _data.y
	}
	
	//Cuando otros jugadores  del servidor se mueven
	if (_type == "newPositionPlayer"){
		if (_data.username != global.user){
			var _npc = undefined
			for (i=0;i<array_length(user_names);i++){
				if (user_names[i].username==_data.username){
					_npc = array_get(user_names,i)
					i = array_length(user_names)
				}
			}
			show_debug_message(_npc)
			if _npc != undefined{
				_npc.x = _data.x
				_npc.y = _data.y
			}
		}
	}
	
	if (_type == "update_data"){
		var manager = instance_find(obj_game_mannager,0)
		manager.time = int64(30-_data.time)
	}
	
	//Cuando se crea otro recurso dentro del juego
	if (_type == "resource"){
		var _resource = instance_create_depth(_data.x,_data.y,1,obj_square)
		var _r = new resource(_data.id,_resource.id)
		array_push(global.resources,_r)
	}
	
	//Elimina del juego actual un recurso
	if (_type == "delete_resource"){
		show_debug_message("Resource eliminado")
		search(_data.id)
	}
	#endregion

}));

/*
colyseus_on_leave(net_room, method(id, function(_room) {
	show_debug_message(_room)
    if (_room == "queue") {
		show_debug_message("¡La cola se completó! Saliendo de la queue...");
    
	    /* Aquí es el momento exacto para unirte a tu sala de juego definitiva (my_room)
	    var _options = "{ \"username\": \""+global.user+"\"}";
	    net_room =  colyseus_client_join_or_create(client, "Room1", _options);
    
	    // Y cambias a la habitación visual de juego en GameMaker
		room_goto(Room1);
	}
}));
*/

colyseus_process()
