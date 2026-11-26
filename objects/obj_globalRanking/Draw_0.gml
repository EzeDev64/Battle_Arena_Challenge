draw_set_font(ft_game)
draw_clear(make_color_rgb(30, 10, 50));

// ---------- Fondo con degradado ----------
draw_rectangle_color(0, 0, room_width, room_height,
    make_color_rgb(18, 6, 36), make_color_rgb(18, 6, 36),
    make_color_rgb(50, 18, 90), make_color_rgb(50, 18, 90), false);

// ---------- Fondo con degradado ----------
draw_rectangle_color(0, 0, room_width, room_height,
    make_color_rgb(18, 6, 36), make_color_rgb(18, 6, 36),
    make_color_rgb(50, 18, 90), make_color_rgb(50, 18, 90), false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);


// Panel
    draw_set_alpha(0.65);
    draw_set_color(make_color_rgb(12, 4, 26));
    draw_roundrect_ext(panel_rank[0], panel_rank[1], panel_rank[2], panel_rank[3], 24, 24, false);
    draw_set_alpha(1);
    draw_set_color(make_color_rgb(120, 70, 210));
    draw_roundrect_ext(panel_rank[0], panel_rank[1], panel_rank[2], panel_rank[3], 24, 24, true);

    // Titulo
    draw_set_halign(fa_center);
    draw_set_color(col_oro);
    draw_text_transformed(cx, 58, "RANKING GLOBAL", 1.8, 1.8, 0);
    draw_set_color(col_texto);
    draw_text(cx, 98, "TOP 10 JUGADORES");

    // Encabezados
    draw_set_halign(fa_center);
    draw_text(cx - 290, 135, "#");
    draw_set_halign(fa_left);
    draw_text(cx - 250, 135, "JUGADOR");
    draw_set_halign(fa_right);
    draw_text(cx + 300, 135, "PUNTOS");
    //draw_text(cx + 300, 135, "VICTORIAS");
    draw_set_color(make_color_rgb(120, 70, 210));
    draw_line(cx - 310, 152, cx + 310, 152);

    // Filas
    for (var i = 0; i < array_length(global.globalRanking); i++) {
        var y1 = 175 + i * 36;
        var fila = global.globalRanking[i];

        // Fondo alternado
        if (i mod 2 == 0) {
            draw_set_alpha(0.10);
            draw_set_color(c_white);
            draw_roundrect_ext(cx - 315, y1 - 16, cx + 315, y1 + 16, 8, 8, false);
            draw_set_alpha(1);
        }

        // Posicion (medalla para los 3 primeros)
        var medalla = -1;
        if (i == 0) medalla = col_oro;
        else if (i == 1) medalla = col_plata;
        else if (i == 2) medalla = col_bronce;

        if (medalla != -1) {
            draw_set_color(medalla);
            draw_circle(cx - 290, y1, 14, false);
            draw_set_color(c_black);
        }
        else {
            draw_set_color(c_white);
        }
        draw_set_halign(fa_center);
        draw_text(cx - 290, y1, string(i + 1));

        // Nombre, puntos y victorias
        draw_set_color((medalla != -1) ? medalla : c_white);
        draw_set_halign(fa_left);
        draw_text(cx - 250, y1, fila.username);

        draw_set_color(c_white);
        draw_set_halign(fa_right);
        draw_text(cx + 300, y1, string(fila.score));
        //draw_text(cx + 300, y1, string(fila.victorias));
    }

    // Posicion del jugador actual
    draw_set_halign(fa_center);
    draw_set_color(col_texto);
    draw_text(cx, 522, "...");

    draw_set_alpha(0.35);
    draw_set_color(col_azul);
    draw_roundrect_ext(cx - 315, 534, cx + 315, 566, 8, 8, false);
    draw_set_alpha(1);

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(cx - 290, 550, string(mi_pos));
    draw_set_halign(fa_left);
    draw_text(cx - 250, 550, global.user + " (TU)");
    draw_set_halign(fa_right);
    draw_text(cx + 300, 550, string(global.player_data.score));
    //draw_text(cx + 300, 550, string(mi_victorias));

    //dibujar_boton(r_atras, "VOLVER AL LOBBY", 1);