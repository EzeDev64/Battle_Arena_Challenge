if (item_array[item_pos][item_type] != item_none) {
    var _type = item_array[item_pos][item_type];

    global.next_item = _type;
    global.next_scale_x = item_array[item_pos][item_scale_x];
    global.next_scale_y = item_array[item_pos][item_scale_y];

    item_array[item_pos][item_amount] -= 1;
    var _inst = instance_create_layer(obj_player1.x, obj_player1.y, "Instances_1", obj_item);

    if (item_array[item_pos][item_amount] < 1) {
        item_array[item_pos][item_type] = item_none;
        item_array[item_pos][item_sprite] = -1;
        item_array[item_pos][item_scale_x] = 1;
        item_array[item_pos][item_scale_y] = 1;
    }
}