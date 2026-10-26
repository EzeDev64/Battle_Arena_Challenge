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

// Contrasena
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(600, 302, "Contrasena");
draw_set_color((campo_activo == "contrasena") ? azul : c_white);
draw_roundrect_ext(350, 320, 850, 370,8,8, false);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_text(365, 345,
    string_repeat("*", string_length(contrasena_registro)) +
    ((campo_activo == "contrasena") ? cursor : "")
);

// Boton registrarse
draw_set_color(azul);
draw_roundrect_ext(450, 410, 750, 465,15,15, false);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(600, 437, "REGISTRARSE");

// Mensaje
draw_text(600, 510, mensaje_registro);

// Boton volver al login
draw_set_color(azul);
draw_roundrect_ext(450, 540, 750, 595,15,15, false);
draw_set_color(c_white);
draw_text(600, 567, "VOLVER AL LOGIN");

// Restaurar alineacion
draw_set_halign(fa_left);
draw_set_valign(fa_top);
