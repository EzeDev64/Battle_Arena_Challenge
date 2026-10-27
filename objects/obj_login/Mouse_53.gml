if (pantalla == "login") {

    // Seleccionar campo de correo
    if (mouse_x >= 350 && mouse_x <= 850 &&
        mouse_y >= 250 && mouse_y <= 300) {

        campo_activo = "correo";
        keyboard_string = correo;
    }

    // Seleccionar campo de contrasena
    else if (mouse_x >= 350 && mouse_x <= 850 &&
             mouse_y >= 330 && mouse_y <= 380) {

        campo_activo = "contrasena";
        keyboard_string = contrasena;
    }

    // Iniciar sesion
    else if (mouse_x >= 450 && mouse_x <= 750 &&
             mouse_y >= 420 && mouse_y <= 475) {
		if state{
			intentar_login();
			state = false
			alarm_set(0,60)
		}
    }

    // Crear cuenta
    else if (mouse_x >= 400 && mouse_x <= 800 &&
             mouse_y >= 490 && mouse_y <= 530) {

        room_goto(Room_Registro);
    }

    // Recuperar contrasena
    else if (mouse_x >= 400 && mouse_x <= 800 &&
             mouse_y >= 540 && mouse_y <= 580) {

        cambiar_pantalla("recuperar");
        mensaje = "Escribe tu correo y el codigo de seguridad";
    }
}
else if (pantalla == "recuperar") {

    // Seleccionar campo de correo
    if (mouse_x >= 350 && mouse_x <= 850 &&
        mouse_y >= 250 && mouse_y <= 300) {

        campo_activo = "correo";
        keyboard_string = correo;
    }

    // Seleccionar campo de codigo
    else if (mouse_x >= 350 && mouse_x <= 850 &&
             mouse_y >= 330 && mouse_y <= 380) {

        campo_activo = "codigo";
        keyboard_string = codigo;
    }

    // Verificar codigo (solo visual por ahora)
    else if (mouse_x >= 450 && mouse_x <= 750 &&
             mouse_y >= 420 && mouse_y <= 475) {

        if (codigo == "") {
            mensaje = "Escribe el codigo de seguridad";
        }
        else {
            mensaje = "Codigo recibido (el cambio de contrasena se hara en el siguiente sprint)";
        }
    }

    // Enviar codigo al correo (solo visual por ahora)
    else if (mouse_x >= 400 && mouse_x <= 800 &&
             mouse_y >= 485 && mouse_y <= 525) {

        if (correo == "") {
            mensaje = "Escribe tu correo";
        }
        else if (string_pos("@", correo) == 0) {
            mensaje = "Ingresa un correo valido";
        }
        else {
            mensaje = "Te enviaremos un codigo";
			if state{
				state = false
				enviar_correo()
				alarm_set(0,60)
			}
        }
    }

    // Volver al inicio
    else if (mouse_x >= 450 && mouse_x <= 750 &&
             mouse_y >= 535 && mouse_y <= 585) {

        cambiar_pantalla("login");
        mensaje = "Ingresa tus datos";
    }
}
