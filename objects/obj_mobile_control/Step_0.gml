// Resetear pulsaciones de un solo frame
btn_take = false;
btn_use  = false;
btn_drop = false;
btn_swap = false;

var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();
var _half_w = _gui_w * 0.5;

// Posiciones base de los 4 botones (esquina inferior derecha)
var _r = min(_gui_w, _gui_h) * 0.065;
var _pad = _r * 2.35;
var _base_x = _gui_w - _r * 2.2;
var _base_y = _gui_h - _r * 2.2;

var _b_take = { x: _base_x - _pad, y: _base_y - _pad, r: _r }; // Tomar
var _b_use  = { x: _base_x,         y: _base_y - _pad, r: _r }; // Usar
var _b_drop = { x: _base_x - _pad, y: _base_y,         r: _r }; // Botar
var _b_swap = { x: _base_x,         y: _base_y,         r: _r }; // Cambiar

// Botón de entrada de texto (arriba a la derecha)
var _txt_btn = {
    x1: _gui_w - 170,
    y1: 20,
    x2: _gui_w - 20,
    y2: 72
};

// Revisar hasta 5 toques simultáneos
for (var _i = 0; _i < 5; _i++) {
    var _mx = device_mouse_x_to_gui(_i);
    var _my = device_mouse_y_to_gui(_i);

    if (device_mouse_check_button_pressed(_i, mb_left)) {
        // 1) Botón de texto
        if (point_in_rectangle(_mx, _my, _txt_btn.x1, _txt_btn.y1, _txt_btn.x2, _txt_btn.y2)) {
           if (point_in_rectangle(_mx, _my, _txt_btn.x1, _txt_btn.y1, _txt_btn.x2, _txt_btn.y2)) {
				chat_async_id = get_string_async("Escribe tu mensaje:", "");
				continue;
			}
        }

        // 2) Botones de acción (círculos)
        if (point_distance(_mx, _my, _b_take.x, _b_take.y) <= _b_take.r) { btn_take = true; continue; }
        if (point_distance(_mx, _my, _b_use.x,  _b_use.y)  <= _b_use.r)  { btn_use  = true; continue; }
        if (point_distance(_mx, _my, _b_drop.x, _b_drop.y) <= _b_drop.r) { btn_drop = true; continue; }
        if (point_distance(_mx, _my, _b_swap.x, _b_swap.y) <= _b_swap.r) { btn_swap = true; continue; }

        // 3) Joystick en la mitad izquierda
        if (joy_touch_id == -1 && _mx < _half_w) {
            joy_touch_id = _i;
            joy_anchor_x = _mx;
            joy_anchor_y = _my;
            joy_knob_x   = _mx;
            joy_knob_y   = _my;
        }
    }

    // Actualizar arrastre del joystick
    if (_i == joy_touch_id && device_mouse_check_button(_i, mb_left)) {
        var _dist = min(point_distance(joy_anchor_x, joy_anchor_y, _mx, _my), joy_radius);
        var _dir  = point_direction(joy_anchor_x, joy_anchor_y, _mx, _my);

        joy_knob_x = joy_anchor_x + lengthdir_x(_dist, _dir);
        joy_knob_y = joy_anchor_y + lengthdir_y(_dist, _dir);

        // Zona muerta pequeña para evitar drift
        if (_dist > 6) {
            move_x = lengthdir_x(_dist / joy_radius, _dir);
            move_y = lengthdir_y(_dist / joy_radius, _dir);
        } else {
            move_x = 0;
            move_y = 0;
        }
    }

    // Soltar joystick
    if (_i == joy_touch_id && device_mouse_check_button_released(_i, mb_left)) {
        joy_touch_id = -1;
        move_x = 0;
        move_y = 0;
    }
}