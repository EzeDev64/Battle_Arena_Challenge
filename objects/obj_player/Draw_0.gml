draw_self();

var _cx = (bbox_left + bbox_right) / 2;
var _cy = (bbox_top + bbox_bottom) / 2;

// Escudo: burbuja celeste (parpadea cuando esta por terminar)
if (current_time < shield_until) {
    if ((shield_until - current_time) > 1500 || ((current_time div 120) mod 2 == 0)) {
        draw_set_alpha(0.25);
        draw_set_color(c_aqua);
        draw_circle(_cx, _cy, 28, false);
        draw_set_alpha(0.8);
        draw_circle(_cx, _cy, 28, true);
        draw_set_alpha(1);
    }
}

// Estrella: puntos amarillos girando alrededor
if (current_time < star_until) {
    draw_set_color(c_yellow);
    for (var _i = 0; _i < 4; _i++) {
        var _a = current_time * 0.25 + _i * 90;
        draw_circle(_cx + lengthdir_x(26, _a), _cy + lengthdir_y(26, _a), 4, false);
    }
}

// Aturdido: puntos grises girando sobre la cabeza
if (current_time < stun_until) {
    draw_set_color(c_gray);
    for (var _i = 0; _i < 3; _i++) {
        var _a2 = current_time * 0.4 + _i * 120;
        draw_circle(_cx + lengthdir_x(14, _a2), bbox_top - 8 + lengthdir_y(4, _a2), 3, false);
    }
}

// Pocion: "x2" sobre la cabeza mientras dura
if (current_time < double_until) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_yellow);
    draw_text(_cx, bbox_top - 14, "x2");
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

draw_set_color(c_white);
draw_set_alpha(1);

