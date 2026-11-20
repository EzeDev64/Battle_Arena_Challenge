if keyboard_check(ord("E")){
	var _pos = 0;
    var _type = itemA.type;
	var _item = itemA
    var _sprite = sprite_index;
	//show_message(itemA)
	//itemA.action()
	
	
	with (obj_inventory) {
        
        // 1. PRIMERA BÚSQUEDA: Intentar apilar (stackear) el ítem
        // Recorre los 5 espacios (índices 0 a 4) buscando si ya existe un ítem del mismo tipo
        while (_pos < 4) {
            if (item_array[_pos][item_type] == _type ){
                break; // Encontró un slot con el mismo ítem, detiene la búsqueda
            } else {
                _pos += 1;
            }
        }

        // 2. SEGUNDA BÚSQUEDA: Buscar un espacio vacío
        // Si _pos llegó a 5 (_pos > 4), significa que no había otro ítem igual para apilar
        if (_pos > 3) {
            _pos = 0; // Reinicia el índice para recorrer desde el inicio
            while (_pos < 4) {
                if (item_array[_pos][item_type] == item_none) {
                    break; // Encontró el primer espacio vacío disponible
                } else {
                    _pos += 1;
                }
            }
        }

        // 3. INSERCIÓN EN EL INVENTARIO
        // Si _pos es menor a 5, significa que encontró un espacio válido (ya sea para apilar o vacío)
        if (_pos < 4) {
            // Si el espacio estaba vacío (cantidad 0), aquí se configurarían propiedades iniciales
            if (item_array[_pos][item_amount] == 0) {
                item_array[_pos][item_scale_x] = other.image_xscale;
                item_array[_pos][item_scale_y] = other.image_yscale;
            }
			
			if (item_array[_pos][item_type] == item_resource and item_array[_pos][item_amount]>0) {
                return
            }
            
            // Actualiza los datos en la matriz del inventario e incrementa la cantidad en 
			item_array[_pos][item_struct] = _item
            item_array[_pos][item_type] = _type;
            item_array[_pos][item_sprite] = _sprite;
            item_array[_pos][item_amount] += 1;
            
            // Destruye la instancia del ítem en el suelo ('other' hace referencia al ítem original)
            with (other) instance_destroy();
        }
        // Nota: Si _pos == 5 en este punto, el inventario está lleno y el ítem no se recoge.
    }

}