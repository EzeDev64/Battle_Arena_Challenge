var _async_id = async_load[? "id"];
var _status = async_load[? "status"];

/*
if (_status == 0) {
    var _result = async_load[? "result"];
    show_debug_message("SE CONECTÓ ALGO!!!")
}
*/

if (async_load[? "status"] == 0) {
	var _result = async_load[? "result"];
	show_debug_message(_result)
    var _json = json_parse(_result);
	if (is_struct(_json) && variable_struct_exists(_json, "accion")) {
		var _accion = _json.accion;
	
		if _accion == "up"{
			control_up = true		
		}else{
			control_up = false		
		}
	
		if _accion == "down"{
			control_down = true		
		}else{
			control_down = false		
		}
	
		if _accion == "left"{
			control_left = true		
		}else{
			control_left = false		
		}

		if _accion == "right"{
			control_right = true		
		}else{
			control_right = false		
		}
	}
}