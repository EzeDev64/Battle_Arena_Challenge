component_on_focus = undefined
last_layer = "Login"
client = instance_find(obj_client,0)
instance_deactivate_layer("Sign_in")
instance_deactivate_layer("Password")

function get_data(_type){
	for (var i = 0; i < instance_number(obj_textbox); i++){
		var _inst = instance_find(obj_textbox, i);
		//show_debug_message(_inst.class)
		if (_inst.class == _type) {
			return variable_instance_get(_inst, "text");
		}
	}
}

function notify(_compID= undefined, _event="", _data={}){
	if _compID==undefined{
		show_debug_message("Ningun evento fue enviado")
		show_debug_log(true)
		return
	}
	
	if _event == "focus"{
		if component_on_focus != undefined{
			variable_instance_set(component_on_focus,"focus",false)
		}
		
		if (variable_instance_exists(_compID, "focus")){
			variable_instance_set(_compID,"focus",true)
			component_on_focus = _compID
		}
		return
	}
	
	if _event == "login"{	
		var _username = get_data("usernameA")
		var _password = get_data("passwordA")
		//show_message($"Loggeando {_username} {_password}")	
		client.login(_username,_password)
		//Hacer más cosas
		return
	}
	
	if _event == "signIn"{
		show_message("Registro")
		instance_deactivate_layer(last_layer)
		instance_activate_layer("Sign_in")
		return
	}
	
	if _event == "password"{
		show_message("Olvidaste la contraseña")
		instance_deactivate_layer(last_layer)
		instance_activate_layer("Password")
		return
	}
	
	if _event == "enviarCode"{
		var _correo = get_data("correoB")
		//show_message($"Enviar código {_correo}")	
		client.mailcode(_correo)
		return
	}
	
	if _event == "verificarCode"{
		var _code = get_data("codigo")
		var _correo = get_data("correoB")
		var _password = get_data("passwordC")
		//show_message($"VerificandoCodigo {_code}")
		client.verification(_code,_correo,_password)
		return
	}
	
	if _event == "crearCuenta"{
		var _username = get_data("usernameB")
		var _password = get_data("passwordB")
		var _correo = get_data("correoA")
		//show_message($"Creando cuenta {_username} {_password} {_correo}")	
		client.sign_in(_username,_password,_correo)
		return
	}
	
	if _event == "volver"{
		show_message("Volviendo")	
		instance_deactivate_layer("Password")
		instance_deactivate_layer("Sign_in")
		instance_activate_layer(last_layer)
		return
	}
}