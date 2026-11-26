/// Step Event: connect once the extension is ready, then poll every frame
if (client == 0) {
    if (!colyseus_is_ready()) exit;
	//Correr de forma local ws
    client = colyseus_client_create("ws://192.168.100.97:2567");
	//Correr desde el server en Azure
	//client = colyseus_client_create("wss://game-server.bravecliff-735637dc.brazilsouth.azurecontainerapps.io");
    net_room = colyseus_client_join_or_create(client, room_get_name(room), {});
}

//Recibe mensajes del servidor
colyseus_on_message(net_room, method(id, function(_room, _type, _data) {
	#region login and sign in	
	
	//Cuando acepta la cola y te tira a la partida
	if (_type=="seat"){
		colyseus_room_leave(_room);
		show_debug_message("¡La cola se completó! Saliendo de la queue...");
		room_goto(Room1);
		var _options = "{ \"username\": \""+global.user+"\"}";
		net_room = colyseus_client_join_or_create(client, "Room1", _options)
	}
	
	if (_type=="login succesfully"){
		show_message("Inicio de sesión exitoso")
		show_debug_message("En cola, esperando una partida...")
		global.user = _data.username
		//global.user = "Eze"
		room_goto(Room_lobby)		
	}
	
	//Al recibir el código para la verificación.
	if (_type =="codesend"){
		//Habilitar todos los campos del código para escribirlo
	}
	
	if (_type =="passwordChange"){
		show_message("Contraseña cambiada")
		instance_find(obj_IGU_mediator,0).notify(id,"volver");
	}
	
	if (_type="servererror"){
		show_message(_data.error)
	}
	
	#endregion	
	
	#region Game
	if (_type == "game_start") {
		define_spawns()
		instance_find(obj_player,0).move_enabled = true
		//var _item = instance_create_layer(global.spawn_lst[0].x,global.spawn_lst[0].y,"Instances",obj_item)
		var _manager = instance_find(obj_game_mannager,0)
		for(var _i=0;_i<array_length(global.spawn_lst);_i++){
			var _item = choose("boots","shield","potion","star","bomb","magnet","resource","big_resource")
			
			var _factory = create_object(_item)
			var _obj = instance_create_layer(global.spawn_lst[_i].x,global.spawn_lst[_i].y,"Instances",obj_item)
			_obj.itemA = _factory.create_object();
		}	
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
				if (user_names[i]==_data.username){
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
		//var _resource = instance_create_depth(_data.x,_data.y,1,obj_square)
		//var _r = new resource(_data.id,_resource.id)
		//array_push(global.resources,_r)
	}
	
	//Elimina del juego actual un recurso
	if (_type == "delete_resource"){
		show_debug_message("Resource eliminado")
		search(_data.id)
	}
	
	// Efecto que manda otro jugador (estrella, iman, bomba)
	if (_type == "effect") {
		var _e = is_string(_data) ? json_parse(_data) : _data;
		if (_e.from != global.user && (_e.target == global.user || _e.target == "all")) {
			var _datos = { value: _e.value, x: _e.x, y: _e.y, mina_id: _e.mina_id };
			with (obj_player) apply_effect(_e.effect, _e.from, _datos);
		}
	}
	#endregion
	
	#region misc
	//Obtener datos del ranking
	if (_type=="global_ranking"){
		//_data = json_parse(_data);
		//var _raw_array = undefined;
		
		//global.globalRanking = _data.ranking	
		var _raw = _data.ranking;

		if (is_string(_raw) && _raw != "") {
		    _raw = json_parse(_raw);
		}

		if (is_array(_raw)) {
		    global.globalRanking = [];

		    for (var i = 0; i < array_length(_raw); i++) {
		        var _item = _raw[i];

		        if (is_struct(_item)) {
		            var _user = variable_struct_exists(_item, "username") ? string(_item.username) : "";
		            var _pts  = variable_struct_exists(_item, "score")    ? real(_item.score)       : 0;

		            array_push(global.globalRanking, {
		                username: _user,
		                score:    _pts
		            });
		        }
		    }
		}
	}
	
	if (_type=="set_player_data"){
		show_debug_message(_data)
		global.player_data = _data
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
