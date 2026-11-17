// Verifica si se solicitó generar un ítem específico desde otro objeto (ej. al soltarlo del inventario)
if (global.next_item == -1) {
    // Si no hay un ítem predefinido, elige uno al azar de los tipos disponibles
    item = choose(item_escudo, item_botas, item_estrella, item_potion, item_resource);
} else {
    // Si hay un ítem en cola, lo asigna a esta instancia y resetea la variable global
    item = global.next_item;
    //image_xscale = global.next_scale_x;
    //image_yscale = global.next_scale_y;
    global.next_item = -1;
}

// Asigna el sprite correspondiente según el tipo de ítem que se haya definido
switch (item) {
    case item_botas:    sprite_index = spr_botas;    break;
    case item_escudo:   sprite_index = spr_escudo;   break;
    case item_estrella: sprite_index = spr_estrella; break;
    case item_potion:   sprite_index = spr_pocion;   break;
    case item_resource: sprite_index = spr_resource; break;
}

// Imprime en consola qué ítem se creó y el nombre de su sprite para depuración
show_debug_message("item = " + string(item) + " sprite = " + sprite_get_name(sprite_index));