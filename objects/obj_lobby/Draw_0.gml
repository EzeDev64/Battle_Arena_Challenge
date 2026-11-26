// ---------- Fondo con degradado ----------
draw_rectangle_color(0, 0, room_width, room_height,
    make_color_rgb(18, 6, 36), make_color_rgb(18, 6, 36),
    make_color_rgb(50, 18, 90), make_color_rgb(50, 18, 90), false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// =====================================================================
// LOBBY
// =====================================================================
if layer_get_visible("Misc"){
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
}else{
	//Here code del layer
	draw_rectangle_color(0, 0, room_width, room_height,
    make_color_rgb(18, 6, 36), make_color_rgb(18, 6, 36),
    make_color_rgb(50, 18, 90), make_color_rgb(50, 18, 90), false);

	// ---------- Medir el formulario ----------
	var izq = 99999;
	var der = 0;
	var arriba = 99999;
	var abajo = 0;

	with (obj_textbox) {
	    izq = min(izq, bbox_left);
	    der = max(der, bbox_right);
	    arriba = min(arriba, bbox_top);
	    abajo = max(abajo, bbox_bottom);
	}
	with (obj_button) {
	    izq = min(izq, bbox_left);
	    der = max(der, bbox_right);
	    abajo = max(abajo, bbox_bottom);
	}

	var tx = room_width / 2;
	var ty = 120;
	var py2 = 600;

	if (abajo > 0) {
		var panel_w = 540;
		var panel_h = 360;
		var px1 = (room_width - panel_w) / 2;
		var py1 = (room_height - panel_h) / 2 + 10;
		var px2 = px1 + panel_w;
		py2 = py1 + panel_h;

		draw_set_alpha(0.75);
		draw_set_color(make_color_rgb(12, 4, 26));
		draw_roundrect_ext(px1, py1, px2, py2, 24, 24, false);
		draw_set_alpha(1);
		draw_set_color(make_color_rgb(120, 70, 210));
		draw_roundrect_ext(px1, py1, px2, py2, 24, 24, true);

		tx = (px1 + px2) / 2;
		ty = py1 - 44;
	}

	// ---------- Titulo ----------
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(make_color_rgb(120, 70, 210));
	draw_text_transformed(tx + 2, ty + 2, "MI PERFIL", 1.8, 1.8, 0);
	draw_set_color(c_white);
	draw_text_transformed(tx, ty, "MI PERFIL", 1.8, 1.8, 0);

	draw_set_color(col_texto);
	draw_text(tx, ty + 34, "Usuario actual: " + string(global.user));

	// ---------- Mensaje (debajo del panel) ----------
	var msg_y = min(py2 + 24, room_height - 36);
	//draw_set_color(mensaje_color);
	//draw_text_ext(tx, msg_y, mensaje, -1, 480);
	// Restaurar alineacion
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
}