draw_set_font(ft_game)
var azul   = make_color_rgb(40, 130, 220);
var azul_h = make_color_rgb(75, 160, 245);
var hover  = position_meeting(mouse_x, mouse_y, id);

// Los botones secundarios van solo con contorno
var secundario = (action == "signIn" || action == "password" || action == "volver");

// La caja roja original queda transparente (solo sirve como area de clic)
image_alpha = 0;
draw_self();

// Sombra (solo botones principales)
if (!secundario) {
    draw_set_alpha(0.30);
    draw_set_color(c_black);
    draw_roundrect_ext(bbox_left + 2, bbox_top + 4, bbox_right + 3, bbox_bottom + 5, 24, 24, false);
    draw_set_alpha(1);
}

// Boton redondeado
draw_set_color(hover ? azul_h : azul);
if (secundario) {
    draw_roundrect_ext(bbox_left, bbox_top, bbox_right + 1, bbox_bottom + 1, 24, 24, true);
    draw_roundrect_ext(bbox_left + 1, bbox_top + 1, bbox_right, bbox_bottom, 23, 23, true);
}
else {
    draw_roundrect_ext(bbox_left, bbox_top, bbox_right + 1, bbox_bottom + 1, 24, 24, false);
}

// Texto: draw_text(x, y, text) tal cual, pero desplazado al centro del boton
matrix_set(matrix_world, matrix_build(sprite_width / 2, sprite_height / 2, 0, 0, 0, 0, 1, 1, 1));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x, y, text);
matrix_set(matrix_world, matrix_build_identity());

// Restaurar alineacion
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);