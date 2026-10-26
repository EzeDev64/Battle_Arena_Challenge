// Seleccionar correo
if (mouse_x >= 350 && mouse_x <= 850 &&
    mouse_y >= 240 && mouse_y <= 290) {

    campo_activo = "correo";
    keyboard_string = correo_registro;
}

// Seleccionar contrasena
else if (mouse_x >= 350 && mouse_x <= 850 &&
         mouse_y >= 320 && mouse_y <= 370) {

    campo_activo = "contrasena";
    keyboard_string = contrasena_registro;
}

// Registrarse
else if (mouse_x >= 450 && mouse_x <= 750 &&
         mouse_y >= 410 && mouse_y <= 465) {

    intentar_registro();
}

// Volver al login
else if (mouse_x >= 450 && mouse_x <= 750 &&
         mouse_y >= 540 && mouse_y <= 595) {

    room_goto(Room1);
}
