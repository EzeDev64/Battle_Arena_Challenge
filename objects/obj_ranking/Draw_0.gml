
// ---------- Fondo con degradado ----------
draw_rectangle_color(0, 0, room_width, room_height,
    make_color_rgb(18, 6, 36), make_color_rgb(18, 6, 36),
    make_color_rgb(50, 18, 90), make_color_rgb(50, 18, 90), false);

// ---------- Panel ----------
draw_set_alpha(0.65);
draw_set_color(make_color_rgb(12, 4, 26));
draw_roundrect_ext(panel[0], panel[1], panel[2], panel[3], 24, 24, false);
draw_set_alpha(1);
draw_set_color(make_color_rgb(120, 70, 210));
draw_roundrect_ext(panel[0], panel[1], panel[2], panel[3], 24, 24, true);

// ---------- Titulo ----------
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(make_color_rgb(120, 70, 210));
draw_text_transformed(cx + 2, 92, "RANKING", 2.4, 2.4, 0);
draw_set_color(col_oro);
draw_text_transformed(cx, 90, "RANKING", 2.4, 2.4, 0);

draw_set_color(col_texto);
draw_text(cx, 135, es_demo ? "RESULTADOS DE LA PARTIDA (DATOS DE EJEMPLO)" : "RESULTADOS DE LA PARTIDA");

// ---------- Encabezados ----------
draw_set_color(col_texto);
draw_set_halign(fa_center);
draw_text(cx - 290, 175, "#");
draw_set_halign(fa_left);
draw_text(cx - 245, 175, "JUGADOR");
draw_set_halign(fa_right);
draw_text(cx + 310, 175, "PUNTOS");
draw_set_color(make_color_rgb(120, 70, 210));
draw_line(cx - 330, 192, cx + 330, 192);

// ---------- Filas (aparecen una por una) ----------
var t = current_time - t_inicio;

for (var i = 0; i < array_length(lista); i++) {
    var fila = lista[i];
    var y1 = 222 + i * 46;

    var a = clamp((t - i * 180) / 350, 0, 1);   // aparicion
    var dx = (1 - a) * 60;                       // desliza desde la derecha
    draw_set_alpha(a);

    var es_mio = (mi_nombre != "" && fila.nombre == mi_nombre);

    // Fondo de la fila
    if (i == 0) {
        draw_set_color(col_oro);
        draw_set_alpha(a * 0.22);
        draw_roundrect_ext(cx - 330 + dx, y1 - 20, cx + 330 + dx, y1 + 20, 10, 10, false);
        draw_set_alpha(a);
        draw_roundrect_ext(cx - 330 + dx, y1 - 20, cx + 330 + dx, y1 + 20, 10, 10, true);
    }
    else if (es_mio) {
        draw_set_color(col_azul);
        draw_set_alpha(a * 0.30);
        draw_roundrect_ext(cx - 330 + dx, y1 - 20, cx + 330 + dx, y1 + 20, 10, 10, false);
        draw_set_alpha(a);
    }
    else if (i mod 2 == 0) {
        draw_set_color(c_white);
        draw_set_alpha(a * 0.08);
        draw_roundrect_ext(cx - 330 + dx, y1 - 20, cx + 330 + dx, y1 + 20, 10, 10, false);
        draw_set_alpha(a);
    }

    // Posicion (medalla para los 3 primeros)
    var medalla = -1;
    if (i == 0) medalla = col_oro;
    else if (i == 1) medalla = col_plata;
    else if (i == 2) medalla = col_bronce;

    if (medalla != -1) {
        draw_set_color(medalla);
        draw_circle(cx - 290 + dx, y1, 15, false);
        draw_set_color(c_black);
    }
    else {
        draw_set_color(c_white);
    }
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(cx - 290 + dx, y1, string(i + 1));

    // Nombre
    draw_set_color((medalla != -1) ? medalla : c_white);
    draw_set_halign(fa_left);
    draw_text(cx - 245 + dx, y1, fila.nombre + (es_mio ? "  (TU)" : ""));

    // Etiqueta del ganador
    if (i == 0) {
        draw_set_color(col_oro);
        draw_set_halign(fa_right);
        draw_text(cx + 190 + dx, y1, "GANADOR");
    }

    // Puntos
    draw_set_color(c_white);
    draw_set_halign(fa_right);
    draw_text(cx + 310 + dx, y1, string(fila.puntos) + " pts");

    draw_set_alpha(1);
}

// Restaurar alineacion
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(1);

// Oculta el sprite del obj_volver (el boton nuevo se dibuja en Draw End)
with (obj_volver) image_alpha = 0;