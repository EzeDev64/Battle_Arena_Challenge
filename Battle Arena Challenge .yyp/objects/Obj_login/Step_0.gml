// Tab: cambia de campo
if (keyboard_check_pressed(vk_tab)) {

    if (pantalla == "login") {
        if (campo_activo == "correo") {
            campo_activo = "contrasena";
            keyboard_string = contrasena;
        }
        else {
            campo_activo = "correo";
            keyboard_string = correo;
        }
    }
    else {
        if (campo_activo == "correo") {
            campo_activo = "codigo";
            keyboard_string = codigo;
        }
        else {
            campo_activo = "correo";
            keyboard_string = correo;
        }
    }
}

// Enter: iniciar sesion (solo en el login)
if (pantalla == "login" && keyboard_check_pressed(vk_enter)) {
    intentar_login();
}

// Lo que se escribe va al campo activo
if (campo_activo == "correo") {
    if (string_length(keyboard_string) > 80) {
        keyboard_string = string_copy(keyboard_string, 1, 80);
    }
    correo = keyboard_string;
}
else if (campo_activo == "contrasena") {
    if (string_length(keyboard_string) > 40) {
        keyboard_string = string_copy(keyboard_string, 1, 40);
    }
    contrasena = keyboard_string;
}
else if (campo_activo == "codigo") {
    if (string_length(keyboard_string) > 6) {
        keyboard_string = string_copy(keyboard_string, 1, 6);
    }
    codigo = keyboard_string;
}
