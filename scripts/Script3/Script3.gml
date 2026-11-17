#macro item_none 0
#macro item_potion 1
#macro item_escudo 2
#macro item_estrella 3
#macro item_botas 4
#macro item_resource 5

#macro item_type 0
#macro item_sprite 1
#macro item_amount 2
#macro item_scale_x 3
#macro item_scale_y 4
global.next_item = -1;


//Posición de los spawning points
global.spawn_lst = []

function define_spawns(){
	for (var i = 0; i < instance_number(obj_spawn); i++){
		var _inst = instance_find(obj_spawn, i);
		array_push(global.spawn_lst,_inst)
	}
	show_debug_message(global.spawn_lst)
}


function resource(_index,_id) constructor{
	index = _index
	id = _id
	function action(){}
}

function concreteCreator() constructor{
	function createItem(){}
}

objectFactory =
{
    
};