usuario_registro = "";
correo_registro = "";
contrasena_registro = "";
campo_activo = "correo";
mensaje_registro = "Completa todos los campos";
state = true

keyboard_string = "";

// Validaciones visuales (no se guarda nada por ahora)
intentar_registro = function() {
    if (correo_registro == "" || contrasena_registro == ""|| usuario_registro=="") {
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
		//var _client = instance_create_depth(0,0,1,obj_client)
		global.user.username = usuario_registro
		obj_client.password = contrasena_registro;
		obj_client.mail = correo_registro
		obj_client.alarm[2] = 30
        mensaje_registro = "Cuenta creada correctamente";
    }
};
