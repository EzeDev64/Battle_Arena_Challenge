correo = "";
contrasena = "";
codigo = "";
campo_activo = "correo";
mensaje = "Ingresa tus datos";
state  = true

// Pantalla actual: "login" o "recuperar"
pantalla = "login";

// Cuenta de prueba (temporal, hasta el siguiente sprint)
correo_prueba = "123prueba@.com";
contrasena_prueba = "123arena";

keyboard_string = "";

// Intenta iniciar sesion con la cuenta de prueba
intentar_login = function() {
	if (correo == "" || contrasena == "") {
        mensaje_registro = "Completa ambos campos";
    }else{
		//var _client = instance_create_depth(0,0,1,obj_client)
		global.user.username = correo
		obj_client.alarm[0] = 30
		obj_client.password = contrasena;
	}
};

function enviar_correo(){
	//var _client = instance_create_depth(0,0,1,obj_client)
	obj_client.alarm[1] = 30
	obj_client.mail = correo;	
}

// Cambia entre "login" y "recuperar" y limpia los campos
cambiar_pantalla = function(nueva) {
    pantalla = nueva;
    correo = "";
    contrasena = "";
    codigo = "";
    campo_activo = "correo";
    keyboard_string = "";
};