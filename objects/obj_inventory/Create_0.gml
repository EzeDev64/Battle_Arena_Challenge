randomize();
item_pos = 0;
item_pos_index = 0;
inv_slots = 4;

item_array = array_create(5);

for (var i = 0; i < 5; i += 1) {
    item_array[i] = array_create(5);
    item_array[i][item_type] = item_none;
    item_array[i][item_sprite] = -1;
    item_array[i][item_amount] = 0;
}