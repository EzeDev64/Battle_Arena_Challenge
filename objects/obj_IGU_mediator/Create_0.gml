component_on_focus = undefined
last_layer = "Login"
client = instance_find(obj_client,0)
instance_deactivate_layer("Sign_in")
instance_deactivate_layer("Password")

ver_clave = false;
// ---------- Colores ----------
col_azul   = make_color_rgb(40, 130, 220);
col_azul_h = make_color_rgb(75, 160, 245);
col_texto  = make_color_rgb(200, 190, 230);
col_ok     = make_color_rgb(110, 230, 150);
col_error  = make_color_rgb(255, 120, 130);

// ---------- Posiciones [x1, y1, x2, y2] ----------
// Se usan las mismas en Draw y en el clic, asi nunca se desalinean
cx = room_width / 2;
panel       = [cx - 270, 35, cx + 270, 760];
r_correo    = [cx - 220, 200, cx + 220, 248];
r_clave     = [cx - 220, 290, cx + 220, 338];
r_ver       = [cx + 110, 290, cx + 220, 338];   // "VER" dentro del campo contrasena
r_entrar    = [cx - 150, 372, cx + 150, 424];
r_crear     = [cx - 150, 468, cx + 150, 504];
r_olvide    = [cx - 150, 508, cx + 150, 544];
r_codigo    = r_clave;
r_verificar = r_entrar;
r_enviar    = [cx - 170, 444, cx + 170, 480];
r_volver    = [cx - 150, 496, cx + 150, 548];

sobre = function(r) {
    return point_in_rectangle(mouse_x, mouse_y, r[0], r[1], r[2], r[3]);
};

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
		if string_trim(_username) == "" or string_trim(_password){
			show_message("Complete los campos de texto")	
			return
		}
		
		//show_message($"Loggeando {_username} {_password}")	
		client.login(_username,_password)
		//Hacer más cosas
		return
	}
	
	if _event == "signIn"{
		//show_message("Registro")
		instance_deactivate_layer(last_layer)
		instance_activate_layer("Sign_in")
		return
	}
	
	if _event == "password"{
		//show_message("Olvidaste la contraseña")
		instance_deactivate_layer(last_layer)
		instance_activate_layer("Password")
		return
	}
	
	if _event == "enviarCode"{
		var _correo = get_data("correoB")
		if string_trim(_correo) == ""{
			show_message("Complete los campos de texto")	
			return
		}
		//show_message($"Enviar código {_correo}")	
		client.mailcode(_correo)
		return
	}
	
	if _event == "verificarCode"{
		var _code = get_data("codigo")
		var _correo = get_data("correoB")
		var _password = get_data("passwordC")
		if string_trim(_code) == "" or string_trim(_password) or string_trim(_correo){
			show_message("Complete los campos de texto")	
			return
		}		
		//show_message($"VerificandoCodigo {_code}")
		client.verification(_code,_correo,_password)
		return
	}
	
	if _event == "crearCuenta"{
		var _username = get_data("usernameB")
		var _password = get_data("passwordB")
		var _correo = get_data("correoA")
		if string_trim(_username) == "" or string_trim(_password) or string_trim(_correo){
			show_message("Complete los campos de texto")	
			return
		}
		//show_message($"Creando cuenta {_username} {_password} {_correo}")	
		client.sign_in(_username,_password,_correo)
		return
	}
	
	if _event == "volver"{
		//show_message("Volviendo")	
		instance_deactivate_layer("Password")
		instance_deactivate_layer("Sign_in")
		instance_activate_layer(last_layer)
		return
	}
}