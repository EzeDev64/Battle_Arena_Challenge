if (item_array[item_pos][item_type] != item_none) {
    var _type = item_array[item_pos][item_type];
	switch(_type){
		case item_botas: _item = "boots";    break;
		case item_escudo: _item = "shield";   break;
		case item_potion: _item = "potion"; break;
		case item_star: _item = "star"; break;
		case item_bomb: _item = "bomb";   break;
		case item_magnet: _item = "magnet";   break;
		case item_resource: _item = "resource"; break;	
	}

    global.next_item = _type;
    global.next_scale_x = item_array[item_pos][item_scale_x];
    global.next_scale_y = item_array[item_pos][item_scale_y];

    item_array[item_pos][item_amount] -= 1;
    //var _inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_item);
	var _factory = client.create_object(_item)
	var _obj  = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_item);
	_obj.itemA = _factory.create_object();

    if (item_array[item_pos][item_amount] < 1) {
		item_array[item_pos][item_struct] = item_none
        item_array[item_pos][item_type] = item_none;
        item_array[item_pos][item_sprite] = -1;
        item_array[item_pos][item_scale_x] = 1;
        item_array[item_pos][item_scale_y] = 1;
    }
}