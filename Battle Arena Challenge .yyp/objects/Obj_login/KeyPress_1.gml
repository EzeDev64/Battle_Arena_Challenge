// Borrar ultimo caracter
if (keyboard_key == vk_backspace) {

    if (campo_activo == "correo" &&
        string_length(correo) > 0) {

        correo = string_delete(
            correo, string_length(correo), 1
        );
    }
    else if (campo_activo == "contrasena" &&
             string_length(contrasena) > 0) {

        contrasena = string_delete(
            contrasena, string_length(contrasena), 1
        );
    }
}

// Cambiar de campo
else if (keyboard_key == vk_tab) {

    if (campo_activo == "correo") {
        campo_activo = "contrasena";
    }
    else {
        campo_activo = "correo";
    }
}

// Agregar caracter escrito
else if (string_length(keyboard_lastchar) > 0) {

    if (campo_activo == "correo") {
        correo += keyboard_lastchar;
    }
    else if (campo_activo == "contrasena") {
        contrasena += keyboard_lastchar;
    }
}