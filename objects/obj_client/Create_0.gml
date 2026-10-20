//Se encarga de conectarse a la red

/// Create Event: nothing is connected yet 
//Configuraciones del servidor
client = 0;
net_room = 0;
room_lst = ["test_waiting_room","test_server_room"]

//Variables para el inicio de sesión no def
password = ""
code = ""
mail = ""

#region multiplayer test
user_names = []

function game_start(){
	if (colyseus_room_is_connected(net_room)) {
		colyseus_send(net_room, "start_game", {});
	}	
}

//Si el jugador se mueve
function user_move(_username,_x,_y){
	if (colyseus_room_is_connected(net_room)) {
		colyseus_send(net_room, "move", {x: _x, y: _y,username: _username});
	}
}

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
	}
}

//Verificación del correo
function verification(_gmail){
	show_debug_message(_gmail)
	colyseus_send(net_room, "verification", {mail: _gmail});
}

function get_resource(){
	if (colyseus_room_is_connected(net_room)) {
		colyseus_send(net_room, "resource_adquiered",{});
	}
}