if (!explotada) {
    // Posicion para que el sprite quede centrado en (x, y), sin importar su origen
    var _dx = x - (sprite_get_width(spr_bomba) / 2 - sprite_get_xoffset(spr_bomba)) * esc;
    var _dy = y - (sprite_get_height(spr_bomba) / 2 - sprite_get_yoffset(spr_bomba)) * esc;

    // El dueno la ve bien; los rivales casi no (es una mina escondida)
    var _mia = (propietario == global.user);
    var _alfa = _mia ? 1 : (armada ? 0.12 : 0.5);
    draw_sprite_ext(spr_bomba, 0, _dx, _dy, esc, esc, 0, c_white, _alfa);

    // Solo el dueno ve la luz: naranja mientras se arma, roja cuando ya esta armada
    if (_mia) {
        draw_set_color(armada ? c_red : c_orange);
        draw_circle(x, y - 14, 2, false);
    }
}
else {
    var _prog = t_explosion / 30;
    draw_set_alpha(1 - _prog);
    draw_set_color(c_orange);
    draw_circle(x, y, radio * _prog, false);
    draw_set_color(c_yellow);
    draw_circle(x, y, radio * _prog * 0.6, false);
    draw_set_alpha(1);
}
draw_set_color(c_white);
