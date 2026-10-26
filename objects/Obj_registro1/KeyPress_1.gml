if (campo_activo == "correo") {

    if (keyboard_check_pressed(vk_backspace)) {
        if (string_length(correo_registro) > 0) {
            correo_registro = string_delete(
                correo_registro,
                string_length(correo_registro),
                1
            );
        }
    }
    else if (keyboard_check_pressed(vk_enter)) {
        campo_activo = "contrasena";
    }
    else {
        var tecla = keyboard_lastchar;

        if (string_length(tecla) == 1 &&
            string_length(correo_registro) < 80) {
            correo_registro += tecla;
        }
    }
}
else if (campo_activo == "contrasena") {

    if (keyboard_check_pressed(vk_backspace)) {
        if (string_length(contrasena_registro) > 0) {
            contrasena_registro = string_delete(
                contrasena_registro,
                string_length(contrasena_registro),
                1
            );
        }
    }
    else if (keyboard_check_pressed(vk_enter)) {
        mensaje_registro = "Pulsa REGISTRARSE";
    }
    else {
        var tecla = keyboard_lastchar;

        if (string_length(tecla) == 1 &&
            string_length(contrasena_registro) < 40) {
            contrasena_registro += tecla;
        }
    }
}