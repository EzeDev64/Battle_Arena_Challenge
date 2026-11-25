// ---------- Fondo con degradado ----------
draw_rectangle_color(0, 0, room_width, room_height,
    make_color_rgb(18, 6, 36), make_color_rgb(18, 6, 36),
    make_color_rgb(50, 18, 90), make_color_rgb(50, 18, 90), false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// =====================================================================
// LOBBY
// =====================================================================

 // Panel
    draw_set_alpha(0.65);
    draw_set_color(make_color_rgb(12, 4, 26));
    draw_roundrect_ext(panel[0], panel[1], panel[2], panel[3], 24, 24, false);
    draw_set_alpha(1);
    draw_set_color(make_color_rgb(120, 70, 210));
    draw_roundrect_ext(panel[0], panel[1], panel[2], panel[3], 24, 24, true);

    // Titulo
    draw_set_color(make_color_rgb(120, 70, 210));
    draw_text_transformed(cx + 2, 82, "BATTLE ARENA CHALLENGE", 1.6, 1.6, 0);
    draw_set_color(c_white);
    draw_text_transformed(cx, 80, "BATTLE ARENA CHALLENGE", 1.6, 1.6, 0);

    draw_set_color(make_color_rgb(120, 70, 210));
    draw_line(cx - 200, 108, cx + 200, 108);

    draw_set_color(c_white);
    draw_text_transformed(cx, 140, "LOBBY", 1.2, 1.2, 0);
    draw_set_color(col_texto);
    draw_text(cx, 178, $"Bienvenido, {global.user}");

    //dibujar_boton(r_jugar, "JUGAR (PROXIMAMENTE)", 2);
    //dibujar_boton(r_ranking, "RANKING", 0);
    //dibujar_boton(r_demo, "VER GANADOR (DEMO)", 0);
    //dibujar_boton(r_salir, "CERRAR SESION", 1);