show_debug_message(campo_activo)
// Seleccionar correo
if (mouse_x >= 350 && mouse_x <= 850 &&
    mouse_y >= 240 && mouse_y <= 290) {

    campo_activo = "correo";
    keyboard_string = correo_registro;
}

// Seleccionar username
else if(mouse_x >= 350 && mouse_x <= 850 &&
         mouse_y >= 320 && mouse_y <= 370) {
			 
	campo_activo = "usuario";
	//keyboard_string = usuario_registro;	
}

// Seleccionar contrasena
else if (mouse_x >= 350 && mouse_x <= 850 &&
         mouse_y >= 400 && mouse_y <= 450) {

    campo_activo = "contrasena";
    keyboard_string = contrasena_registro;
}

// Registrarse
else if (mouse_x >= 450 && mouse_x <= 750 &&
         mouse_y >= 460 && mouse_y <= 515) {
	if state{
		intentar_registro();
		state = false
		alarm_set(0,60)
	}
}

// Volver al login
else if (mouse_x >= 450 && mouse_x <= 750 &&
         mouse_y >= 575 && mouse_y <= 630) {

    room_goto(Room_login);
}
