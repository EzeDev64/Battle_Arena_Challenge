// Tab: cambia de campo
if (keyboard_check_pressed(vk_tab)) {
    if (campo_activo == "correo") {
        campo_activo = "contrasena";
        keyboard_string = contrasena_registro;
    }
    else {
        campo_activo = "correo";
        keyboard_string = correo_registro;
    }
}

// Enter: del correo pasa a la contrasena; en la contrasena registra
if (keyboard_check_pressed(vk_enter)) {
    if (campo_activo == "correo") {
        campo_activo = "contrasena";
        keyboard_string = contrasena_registro;
    }
    else {
        intentar_registro();
    }
}

// Lo que se escribe va al campo activo
if (campo_activo == "correo") {
    if (string_length(keyboard_string) > 80) {
        keyboard_string = string_copy(keyboard_string, 1, 80);
    }
    correo_registro = keyboard_string;
}
else {
    if (string_length(keyboard_string) > 40) {
        keyboard_string = string_copy(keyboard_string, 1, 40);
    }
    contrasena_registro = keyboard_string;
}