var _s = 1;
var _x = 20;                  // posición del inventario en pantalla
var _y = 20;
var _step = 53 * _s;          // distancia entre casillas
var _box = 40 * _s;           // zona donde cabe cada ítem dentro de la casilla

// 1. Fondo del inventario
draw_sprite_ext(sprite_index, 0,
    _x + sprite_get_xoffset(sprite_index) * _s,
    _y + sprite_get_yoffset(sprite_index) * _s,
    _s, _s, 0, c_white, 1);

// Posición de la primera casilla
var _slot_x0 = _x + 13 * _s;
var _slot_y0 = _y + 13 * _s;

// 2. Ítems y cantidades
for (var i = 0; i < 5; i += 1) {
    var _slot_x = _slot_x0 + i * _step;
    var _slot_y = _slot_y0;

    if (item_array[i][item_type] != item_none) {
        var _spr = item_array[i][item_sprite];
        var _w = sprite_get_width(_spr);
        var _h = sprite_get_height(_spr);
        var _item_scale = 1.2; // 1 = tamaño actual, 1.5 = 50% más grande, 2 = doble
		var _k = min(_box / _w, _box / _h) * _item_scale;;

        var _dx = _slot_x + (_box - _w * _k) / 2 + sprite_get_xoffset(_spr) * _k;
        var _dy = _slot_y + (_box - _h * _k) / 2 + sprite_get_yoffset(_spr) * _k;

        draw_sprite_ext(_spr, 0, _dx+10, _dy+5, _k, _k, 0, c_white, 1);

        draw_set_font(-1);
        draw_set_halign(fa_right+20);
        draw_set_valign(fa_bottom);
        draw_text(_slot_x + _box - 10, _slot_y + _box - 20, string(item_array[i][item_amount]));
    }
}

// 3. Selector encima de la casilla actual
draw_sprite_ext(spr_selected_item, item_pos_index,
    _slot_x0 + item_pos * _step + sprite_get_xoffset(spr_selected_item) * _s,
    _slot_y0 + sprite_get_yoffset(spr_selected_item) * _s,
    _s, _s, 0, c_white, 1);

// 4. Restaura la fuente y alineación para otros textos
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);