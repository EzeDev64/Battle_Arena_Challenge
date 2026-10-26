correo = "";
contrasena = "";
codigo = "";
campo_activo = "correo";
mensaje = "Ingresa tus datos";

// Pantalla actual: "login" o "recuperar"
pantalla = "login";

// Cuenta de prueba (temporal, hasta el siguiente sprint)
correo_prueba = "123prueba@.com";
contrasena_prueba = "123arena";

keyboard_string = "";

// Intenta iniciar sesion con la cuenta de prueba
intentar_login = function() {
    if (correo == correo_prueba && contrasena == contrasena_prueba) {
        room_goto(Room_Lobby);
    }
    else {
        mensaje = "Correo o contrasena incorrectos";
    }
};

// Cambia entre "login" y "recuperar" y limpia los campos
cambiar_pantalla = function(nueva) {
    pantalla = nueva;
    correo = "";
    contrasena = "";
    codigo = "";
    campo_activo = "correo";
    keyboard_string = "";
};