if (global.next_item == -1) {
    item = choose(item_escudo, item_botas, item_estrella, item_potion);
} else {
    item = global.next_item;
    image_xscale = global.next_scale_x;
    image_yscale = global.next_scale_y;
    global.next_item = -1;
}

switch (item) {
    case item_botas:    sprite_index = spr_botas;    break;
    case item_escudo:   sprite_index = spr_escudo;   break;
    case item_estrella: sprite_index = spr_estrella; break;
    case item_potion:   sprite_index = spr_pocion;   break;
}
show_debug_message("item = " + string(item) + " sprite = " + sprite_get_name(sprite_index));