/*
#macro item_type 0
#macro item_sprite 1
#macro item_amount 2
#macro item_scale_x 3
#macro item_scale_y 4
*/

randomize();
item_pos = 0;
item_pos_index = 0;
inv_slots = 4;

item_array = array_create(5);

for (var i = 0; i < 4; i += 1) {
    item_array[i] = array_create(5);
	item_array[i][item_struct] = item_none
    item_array[i][item_type] = item_none;
    item_array[i][item_sprite] = -1;
    item_array[i][item_amount] = 0;
}
show_debug_message(item_array)
//Agregados
mediator = instance_find(obj_game_mannager,0)
client = instance_find(obj_client,0)