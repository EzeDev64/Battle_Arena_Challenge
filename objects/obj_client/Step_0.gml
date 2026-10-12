/// Step Event: connect once the extension is ready, then poll every frame
 
if (client == 0) {
    if (!colyseus_is_ready()) exit;
 
    client = colyseus_client_create("http://localhost:2567");
	
	var _options = "{ \"username\": \""+global.user.username+"\" }";
    net_room = colyseus_client_join_or_create(client, "test_server_room", _options);
    //net_setup_handlers(net_room);   // see below
}

colyseus_on_message(net_room, method(id, function(_room, _type, _data) {
	// Verificamos si el mensaje recibido es de tipo "anuncio"
	if (_type == "anuncio") {
		//show_message("Servidor dice: " + string(_data.mensaje));
	}
	
	if (_type == "player_connected") {
		if (_data.username != global.user.username){
			show_message("Jugador conectado");
			var _npc = instance_create_layer(100,100,"Instances",obj_npc)
			array_push(user_names,_data.username)
			_npc.x = _data.x
			_npc.y = _data.y
		}
	}
	
	if (_type == "player_init_position"){
		var _player = instance_create_layer(100,100,"Instances",obj_player)
		_player.x = _data.x
		_player.y = _data.y
	}

	if (_type == "newX") {
		show_debug_message("Se recibió el X");
		obj_square.x = int64(_data.mensaje)
	}
	
	if (_type == "newY") {
		show_debug_message("Se recibió el Y");
		obj_square.y = int64(_data.mensaje)
	}
	
}));
 
colyseus_process();
 
if (colyseus_room_is_connected(net_room)) {
    //colyseus_send(net_room, "move", {username: obj_player.user_name, x: obj_player.x, y:  obj_player.y });
	// Escuchamos el mensaje personalizado "anuncio" enviado desde TypeScript
	if observer == true{
		colyseus_send(net_room, "square", {x: obj_square.x, y: obj_square.y});
		observer = false;
	}
}

