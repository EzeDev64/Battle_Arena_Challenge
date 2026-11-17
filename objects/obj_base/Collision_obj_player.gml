//Esto está hardcodeado pero funciona

 var _pos = 0

 with(obj_inventory){
	 while (_pos < 5) {
	    if (item_array[_pos][item_type] == item_resource) {
			item_array[_pos][item_amount] -= 1;
			item_array[_pos][item_type] = item_none;
			item_array[_pos][item_sprite] = -1;
			mediator.notify(id,"get_point",{value:10})
	        break; // Encontró un slot con el mismo ítem, detiene la búsqueda
	    } else {
			_pos += 1;
		}
	}
	

 }