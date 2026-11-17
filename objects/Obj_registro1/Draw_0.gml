draw_clear(make_color_rgb(30, 10, 50));

var azul = make_color_rgb(40, 130, 220);
var cursor = ((current_time div 500) mod 2 == 0) ? "|" : "";

// Titulos
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(600, 100, "BATTLE ARENA CHALLENGE");
draw_text(600, 180, "CREAR CUENTA");

// Correo
draw_text(600, 222, "Correo electronico");
draw_set_color((campo_activo == "correo") ? azul : c_white);
draw_roundrect_ext(350, 240, 850, 290,8,8, false);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_text(365, 265, correo_registro + ((campo_activo == "correo") ? cursor : ""));

// Nombre de usuario
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(600, 302, "Nombre de usuario");
draw_set_color((campo_activo == "usuario") ? azul : c_white);
draw_roundrect_ext(350, 320, 850, 370, 8, 8, false);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_text(365, 345, usuario_registro + ((campo_activo == "usuario") ? cursor : ""));

// Contrasena (Desplazada hacia abajo manteniendo la estructura)
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(600, 382, "Contrasena");
draw_set_color((campo_activo == "contrasena") ? azul : c_white);
draw_roundrect_ext(350, 400, 850, 450, 8, 8, false);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_text(365, 425,
    string_repeat("*", string_length(contrasena_registro)) +
    ((campo_activo == "contrasena") ? cursor : "")
);

// Boton registrarse (Desplazado de forma segura)
draw_set_color(azul);
draw_roundrect_ext(450, 460, 750, 515, 15, 15, false);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(600, 490, "REGISTRARSE");

// Mensaje
draw_text(600, 545, mensaje_registro);

// Boton volver al login
draw_set_color(azul);
draw_roundrect_ext(450, 575, 750, 630, 15, 15, false);
draw_set_color(c_white);
draw_text(600, 602, "VOLVER AL LOGIN");

// Restaurar alineacion
draw_set_halign(fa_left);
draw_set_valign(fa_top);