correo_registro = "";
contrasena_registro = "";
campo_activo = "correo";
mensaje_registro = "Completa todos los campos";

keyboard_string = "";

// Validaciones visuales (no se guarda nada por ahora)
intentar_registro = function() {
    if (correo_registro == "" || contrasena_registro == "") {
        mensaje_registro = "Completa ambos campos";
    }
    else if (string_pos("@", correo_registro) == 0 ||
             string_pos(".", correo_registro) == 0) {
        mensaje_registro = "Ingresa un correo valido";
    }
    else if (string_length(contrasena_registro) < 6) {
        mensaje_registro = "Minimo 6 caracteres";
    }
    else {
        mensaje_registro = "Cuenta creada correctamente (demo)";
    }
};
