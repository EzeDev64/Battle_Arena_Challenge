client = 0;
net_room = 0;
user_names = []

#region Funciones de Login y Sign-in:
//Iniciar sesión
function login(_username,_password){
	if (colyseus_room_is_connected(net_room)) {
		colyseus_send(net_room, "login", {username: _username, password: _password});
	}
}
//Registrarse
function sign_in(_username, _password,_mail)	{
	if (colyseus_room_is_connected(net_room)) {
		colyseus_send(net_room, "sign_in", {username: _username, password: _password, mail: _mail});
		//show_message($"En client{_username} {_password} {_mail}")
	}
}

//Verificar correo
function mailcode(_gmail){
	show_debug_message(_gmail)
	colyseus_send(net_room, "mailcode", {mail: _gmail});
}

//Verificar código
function verification(_code,_gmail,_password){
	colyseus_send(net_room, "verification", {code: _code,mail: _gmail,password: _password});
}
#endregion 

function get_resource(){
	if (colyseus_room_is_connected(net_room)) {
		colyseus_send(net_room, "resource_adquiered",{score:obj_player.points});
	}
}

function game_start(){
	if (colyseus_room_is_connected(net_room)) {
		colyseus_send(net_room, "start_game", {});
	}	
}

//Si el jugador se mueve
function user_move(_username,_x,_y){
	if (colyseus_room_is_connected(net_room)) {
		show_debug_message("Me estoy moviendo")
		colyseus_send(net_room, "move", {x: _x, y: _y,username: _username});
	}
}