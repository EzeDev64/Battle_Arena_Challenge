/// Step Event: connect once the extension is ready, then poll every frame
 
if (client == 0) {
    if (!colyseus_is_ready()) exit;
    client = colyseus_client_create("http://192.168.100.97:2567");
	var _options = "{ \"username\": \""+global.user.username+"\" }";
    net_room = colyseus_client_join_or_create(client,room_lst[global.actual_room], _options);
}

//Recibe mensajes del servidor
colyseus_on_message(net_room, method(id, function(_room, _type, _data) {
	#region in-game	
	
	//Cuando un usuario se conecta
	if (_type == "player_connected") {
		if (_data.username != global.user.username){
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
		var _player = instance_create_layer(100,100,"Instances",obj_player)
		_player.x = _data.x
		_player.y = _data.y
	}
	
	//Cuando otros jugadores  del servidor se mueven
	if (_type == "newPositionPlayer"){
		if (_data.username != global.user.username){
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
	
	if (_type == "resource"){
		var _resource = instance_create_depth(_data.x,_data.y,1,obj_square)
		var _r = new resource(_data.id,_resource.id)
		array_push(global.resources,_r)
	}
	
	if (_type == "delete_resource"){
		show_debug_message("Resource eliminado")
		search(_data.id)
	}
	
	#endregion
	
	#region login and sign-in
	//Cuando el usuario ya existe
	if (_type=="user already exists"){
		show_message("Usuario ya registrado salga de la aplicación e intentelo nuevamente")
		game_end()
	}
	
	//Cuando se logra el inicio de sesión
	if (_type=="login succesfully"){
		show_message("Inicio de sesión exitoso")
		global.actual_room = 1
		//alarm_set(3,90)
		room_goto(test_server_room)
	}
	
	//Al recibir el código para la verificación.
	if (_type =="code"){
		code = _data.code
		show_debug_message(code)
	}
	#endregion
	
}));
 
colyseus_process();
