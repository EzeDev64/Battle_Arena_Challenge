var azul = make_color_rgb(40, 130, 220);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Etiqueta arriba del cuadro
draw_set_color(make_color_rgb(200, 190, 230));
draw_text(x, y - 20, title);

// El cuadro azul original queda transparente (solo sirve como area de clic)
image_alpha = 0;
draw_self();

// Borde azul si tiene el foco
if (focus) {
    draw_set_color(azul);
    draw_roundrect_ext(bbox_left - 2, bbox_top - 2, bbox_right + 3, bbox_bottom + 3, 16, 16, false);
}

// Caja
draw_set_color(make_color_rgb(245, 245, 250));
draw_roundrect_ext(bbox_left, bbox_top, bbox_right + 1, bbox_bottom + 1, 14, 14, false);

// Texto (asteriscos si es contrasena); si no cabe, muestra el final
var texto = (string_pos("password", class) > 0) ? string_repeat("*", string_length(text)) : text;
var maxw = sprite_width - 32;
while (string_width(texto) > maxw) texto = string_delete(texto, 1, 1);

// Cursor parpadeante
if (focus && ((current_time div 500) mod 2 == 0)) texto += "|";

// Se dibuja con draw_text(x, y, ...) desplazado al interior del cuadro
matrix_set(matrix_world, matrix_build(16, sprite_height / 2, 0, 0, 0, 0, 1, 1, 1));
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_text(x, y, texto);
matrix_set(matrix_world, matrix_build_identity());

// Restaurar alineacion
draw_set_valign(fa_top);
draw_set_color(c_white);

