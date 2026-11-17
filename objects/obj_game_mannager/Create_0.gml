time = 30

client = instance_find(obj_client,0)

function notify(_compID= undefined, _event="", _data={}){
	if _compID==undefined{
		show_debug_message("Ningun evento fue enviado")
		show_debug_log(true)
		return
	}
	
	if _event == "get_point"{
		obj_player.points += _data.value
		client.get_resource()
	}
	
	if _event == "user_move"{
		client.user_move(global.user,obj_player.x,obj_player.y)
	}
}