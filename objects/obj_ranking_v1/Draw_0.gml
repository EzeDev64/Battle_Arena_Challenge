draw_set_font(ft_game)
draw_clear(make_color_rgb(30, 10, 50));

// ---------- Fondo con degradado ----------
draw_rectangle_color(0, 0, room_width, room_height,
    make_color_rgb(18, 6, 36), make_color_rgb(18, 6, 36),
    make_color_rgb(50, 18, 90), make_color_rgb(50, 18, 90), false);

// =====================================================================
// GANADOR (partida de ejemplo con 3 jugadores)
// =====================================================================
   // ---------- Ganador (partida de ejemplo) ----------
hay_empate = false;
t_inicio = 0;
confeti = [];
   
	var t = current_time - t_inicio;
    var cy = 200;

    // Rayos giratorios detras del ganador
    draw_set_alpha(0.12);
    draw_set_color(col_oro);
    var ang = current_time * 0.03;
    for (var i = 0; i < 12; i++) {
        var a = ang + i * 30;
        draw_triangle(cx, cy,
            cx + lengthdir_x(560, a - 7), cy + lengthdir_y(560, a - 7),
            cx + lengthdir_x(560, a + 7), cy + lengthdir_y(560, a + 7), false);
    }
    draw_set_alpha(1);

    // Confeti
    for (var i = 0; i < array_length(confeti); i++) {
        var c = confeti[i];
        draw_set_color(c.col);
        draw_rectangle(c.x, c.y, c.x + c.w, c.y + c.w * 0.5, false);
    }

    // ----- Podio (las barras suben con animacion) -----
    var base = 560;
    var p = clamp(t / 1200, 0, 1);
    var suave = 1 - power(1 - p, 3);

    var xs = [cx, cx - 170, cx + 170];      // 1ro al centro, 2do izquierda, 3ro derecha
    var altos = [210, 160, 120];
    var cols = [col_oro, col_plata, col_bronce];

    for (var i = 0; i < 3; i++) {
        var h = altos[i] * suave;

        draw_set_color(cols[i]);
        draw_roundrect_ext(xs[i] - 70, base - h, xs[i] + 70, base, 10, 10, false);

        if (h > 50) {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_color(c_black);
            draw_text_transformed(xs[i], base - h / 2, string(i + 1), 2.2, 2.2, 0);
        }

        // Nombre y puntos sobre la barra (aparecen al final de la subida)
        var alfa = clamp((t - 900) / 400, 0, 1);
        draw_set_alpha(alfa);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_white);
		show_debug_message(jugadores)
        draw_text(xs[i], base - altos[i] - 38, jugadores[i].nombre);
        draw_set_color(cols[i]);
        draw_text(xs[i], base - altos[i] - 18, string(jugadores[i].puntos) + " pts");
        draw_set_alpha(1);
    }

    // ----- Titulo animado -----
    var arcoiris = make_color_hsv((current_time / 8) mod 255, 190, 255);
    var pulso = 1 + 0.08 * sin(current_time * 0.006);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(arcoiris);
    draw_text_transformed(cx, 50, hay_empate ? "EMPATE" : "GANADOR", 2.6 * pulso, 2.6 * pulso, 0);

    // Corona (solo si hay un ganador claro)
    if (!hay_empate) {
        var bob = sin(current_time * 0.004) * 5;
        var yc = 118 + bob;
        draw_set_color(col_oro);
        draw_rectangle(cx - 30, yc, cx + 30, yc + 12, false);
        draw_triangle(cx - 30, yc, cx - 16, yc, cx - 30, yc - 22, false);
        draw_triangle(cx - 14, yc, cx + 14, yc, cx, yc - 30, false);
        draw_triangle(cx + 16, yc, cx + 30, yc, cx + 30, yc - 22, false);
    }

    // Nombre del ganador
    draw_set_color(c_white);
    var nombre_ganador = hay_empate ? (jugadores[0].nombre + " y " + jugadores[1].nombre) : jugadores[0].nombre;
    draw_text_transformed(cx, 168, nombre_ganador, 2 * pulso, 2 * pulso, 0);

    draw_set_color(col_oro);
    draw_text_transformed(cx, 212, string(jugadores[0].puntos) + " PUNTOS", 1.3, 1.3, 0);
