var v = instance_find(obj_volver, 0);

if (v != noone) {
    var hover = position_meeting(mouse_x, mouse_y, v);

    // Tapa el sprite estirado del obj_volver con un boton redondeado
    draw_set_color(hover ? col_azul_h : col_azul);
    draw_roundrect_ext(v.bbox_left, v.bbox_top, v.bbox_right, v.bbox_bottom, 16, 16, false);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text((v.bbox_left + v.bbox_right) / 2, (v.bbox_top + v.bbox_bottom) / 2, "SALIR");

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
