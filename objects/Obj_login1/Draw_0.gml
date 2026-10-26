draw_clear(make_color_rgb(30, 10, 50));

var azul = make_color_rgb(40, 130, 220);
var cursor = ((current_time div 500) mod 2 == 0) ? "|" : "";

// Titulo
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(600, 150, "BATTLE ARENA CHALLENGE");

if (pantalla == "recuperar") {
    draw_text(600, 190, "RECUPERAR CONTRASENA");
}

// Texto correo
draw_set_color(c_white);
draw_text(600, 230, "Correo electronico");

// Campo correo
draw_set_color((campo_activo == "correo") ? azul : c_white);
draw_roundrect_ext(350, 250, 850, 300,8,8, false);

draw_set_color(c_black);
draw_set_halign(fa_left);
draw_text(365, 275, correo + ((campo_activo == "correo") ? cursor : ""));

if (pantalla == "login") {

    // Texto contrasena
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(600, 310, "Contrasena");

    // Campo contrasena
    draw_set_color((campo_activo == "contrasena") ? azul : c_white);
    draw_roundrect_ext(350, 330, 850, 380,8,8, false);

    // Asteriscos
    draw_set_color(c_black);
    draw_set_halign(fa_left);
    draw_text(365, 355,
        string_repeat("*", string_length(contrasena)) +
        ((campo_activo == "contrasena") ? cursor : "")
    );

    // Boton iniciar sesion
    draw_set_color(azul);
    draw_roundrect_ext(450, 420, 750, 475,25,25, false);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(600, 447, "INICIAR SESION");

    // Crear cuenta
    draw_text(600, 510, "CREAR CUENTA");

    // Recuperar contrasena
    draw_text(600, 560, "OLVIDE MI CONTRASENA");

    // Mensaje
    draw_text(600, 610, mensaje);
}
else {

    // Texto codigo
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(600, 310, "Codigo de seguridad");

    // Campo codigo
    draw_set_color((campo_activo == "codigo") ? azul : c_white);
    draw_roundrect_ext(350, 330, 850, 380,8,8, false);

    draw_set_color(c_black);
    draw_set_halign(fa_left);
    draw_text(365, 355, codigo + ((campo_activo == "codigo") ? cursor : ""));

    // Boton verificar codigo
    draw_set_color(azul);
    draw_roundrect_ext(450, 420, 750, 475,15,15,false);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(600, 447, "VERIFICAR CODIGO");

    // Enlace enviar codigo
    draw_text(600, 505, "ENVIAR CODIGO AL CORREO");

    // Boton volver al inicio
    draw_set_color(azul);
    draw_roundrect_ext(450, 535, 750, 585,15,15, false);
    draw_set_color(c_white);
    draw_text(600, 560, "VOLVER AL INICIO");

    // Mensaje
    draw_text(600, 620, mensaje);
}

// Restaurar alineacion
draw_set_halign(fa_left);
draw_set_valign(fa_top);
