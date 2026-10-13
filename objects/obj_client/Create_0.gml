//Se encarga de conectarse a la red


/// Create Event: nothing is connected yet 
client = 0;
net_room = 0;
observer = false;

#region multiplayer test
user_names = []

function user_move(_username,_x,_y){
	colyseus_send(net_room, "move", {x: _x, y: _y,username: _username});
}