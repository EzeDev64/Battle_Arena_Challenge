client = instance_create_depth(0,0,1,obj_client)
function login(_username,_password){
	var _contend = {username: _username, password: _password}
	client.send_message("login",_contend)
}