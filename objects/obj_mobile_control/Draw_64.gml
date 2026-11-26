var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

// 1) Dibujar joystick si está activo
if (joy_touch_id != -1) {
    draw_set_alpha(0.35);
    draw_set_color(c_white);
    draw_circle(joy_anchor_x, joy_anchor_y, joy_radius, false);

    draw_set_alpha(0.75);
    draw_set_color(c_aqua);
    draw_circle(joy_knob_x, joy_knob_y, joy_radius * 0.45, false);
}

// 2) Dibujar los 4 botones de acción
var _r = min(_gui_w, _gui_h) * 0.065;
var _pad = _r * 2.35;
var _base_x = _gui_w - _r * 2.2;
var _base_y = _gui_h - _r * 2.2;

var _buttons = [
    { label: "TOMAR",   x: _base_x - _pad, y: _base_y - _pad, active: btn_take },
    { label: "USAR",    x: _base_x,         y: _base_y - _pad, active: btn_use  },
    { label: "BOTAR",   x: _base_x - _pad, y: _base_y,         active: btn_drop },
    { label: "CAMBIAR", x: _base_x,         y: _base_y,         active: btn_swap }
];

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var _j = 0; _j < array_length(_buttons); _j++) {
    var _b = _buttons[_j];
    draw_set_alpha(_b.active ? 0.85 : 0.45);
    draw_set_color(_b.active ? c_yellow : c_dkgray);
    draw_circle(_b.x, _b.y, _r, false);

    draw_set_alpha(0.9);
    draw_set_color(c_white);
    draw_circle(_b.x, _b.y, _r, true);
    draw_text(_b.x, _b.y, _b.label);
}

// 3) Dibujar botón de texto
var _tx1 = _gui_w - 170;
var _ty1 = 20;
var _tx2 = _gui_w - 20;
var _ty2 = 72;

draw_set_alpha(0.65);
draw_set_color(c_navy);
draw_roundrect(_tx1, _ty1, _tx2, _ty2, false);

draw_set_alpha(0.95);
draw_set_color(c_white);
draw_roundrect(_tx1, _ty1, _tx2, _ty2, true);
draw_text((_tx1 + _tx2) * 0.5, (_ty1 + _ty2) * 0.5, "TEXTO");

// Restaurar alineación y alfa
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_color(c_white);