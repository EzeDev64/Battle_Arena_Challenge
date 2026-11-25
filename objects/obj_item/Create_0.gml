if (global.next_item == -1) {
    // Si no hay un ítem predefinido, elige uno al azar de los tipos disponibles
    item = choose(item_botas,item_escudo, item_potion, item_star, item_resource);
} else {
    item = global.next_item;
    image_xscale = global.next_scale_x;
    image_yscale = global.next_scale_y;
    global.next_item = -1;
}

/* Asigna el sprite correspondiente según el tipo de ítem que se haya definido
switch (item) {
    case item_botas:    sprite_index = spr_botas;    break;
    case item_escudo:   sprite_index = spr_escudo;   break;
    case item_estrella: sprite_index = spr_estrella; break;
    case item_potion:   sprite_index = spr_pocion;   break;
    case item_resource: sprite_index = spr_resource; break;
}*/

// Imprime en consola qué ítem se creó y el nombre de su sprite para depuración
show_debug_message("item = " + string(item) + " sprite = " + sprite_get_name(sprite_index));


#region Re-factoring
inventario = instance_find(obj_inventory,0)
activator = true
itemA = undefined
slot_inst_id = array_create(5, noone);

function update_sprite(){
	switch (itemA.type) {
		case item_botas: sprite_index = spr_botas;    break;
		case item_escudo: sprite_index = spr_escudo;   break;
		case item_potion: sprite_index = spr_pocion; break;
		case item_star: sprite_index = spr_estrella; break;
		case item_bomb: sprite_index = spr_bomba;   break;
		case item_magnet: sprite_index = spr_iman;   break;
		case item_resource: sprite_index = spr_resource; break;
	}
	
	/*
	if (itemA.type) {
	    if (is_instanceof(itemA, obj_boots)) {
	        sprite_index = spr_botas;
	    } else if (is_instanceof(itemA, obj_shield)) {
	        sprite_index = spr_escudo;
	    } else if (is_instanceof(itemA, obj_star)) {
	        sprite_index = spr_estrella;
	    } else if (is_instanceof(itemA, obj_potion)) {
	        sprite_index = spr_pocion;
	    } else if (is_instanceof(itemA,obj_resource) and itemA.points == 10){
	        sprite_index = spr_resource;
	    }else if(is_instanceof(itemA,obj_resource) and itemA.points > 10){
			sprite_index = spr_resource;
			image_xscale = 2
			image_yscale = 2
		} else {
			sprite_index = spr_suriken;
		}
	}
	*/
}
#endregion
