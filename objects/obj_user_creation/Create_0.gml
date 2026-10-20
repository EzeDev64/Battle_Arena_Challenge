password = ""
create_password  = ""
verification_code =  ""
mail = ""
question = show_question("Tienes una cuenta?");

if(question){
	username = get_string_async("Nombre de usuario?", "Generic User");
	password = get_string_async("Contraseña?", "");
}else{
	username = get_string_async("Nombre de usuario?", "Generic User");
	create_password = get_string_async("Crear contraseña?", "");
	mail = get_string_async("Ingrese su correo", "");
	verification_code = get_string_async("Ingrese el código enviado al correo", "");
	//msg = get_string_async("Nombre de usuario?", "Generic User");
}