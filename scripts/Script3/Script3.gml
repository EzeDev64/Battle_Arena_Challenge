#macro item_none 0
#macro item_botas 1
#macro item_escudo 2
#macro item_potion 3
#macro item_star 4
#macro item_bomb 5
#macro item_magnet 6
#macro item_resource 7

#macro item_type 0
#macro item_struct 1
#macro item_sprite 3
#macro item_amount 4
#macro item_scale_x 5
#macro item_scale_y 6
global.next_item = -1;

//Posición de los spawning points
global.spawn_lst = []

function define_spawns(){
	for (var i = 0; i < instance_number(obj_spawn); i++){
		var _inst = instance_find(obj_spawn, i);
		array_push(global.spawn_lst,_inst)
	}
	//show_debug_message(global.spawn_lst)
}


#region Interfaces
/// @desc "Interfaz" base de acción
function IAction() constructor {
    action = function() {
        show_error("IAction.action() debe ser implementado en el struct hijo.", true);
    };
}	
	
/// @desc Struct creador base con el factory method create_object
function ActionFactory() constructor {
    create_object = function() {
        show_error("ActionFactory.create_object() debe ser implementado por una fábrica concreta.", true);
        return undefined;
    };

    // Método de plantilla opcional que usa el producto creado
    run_action = function() {
        var _item = create_object();
        if (_item != undefined) {
            _item.action();
        }
        return _item;
    };
}
#endregion

#region Objetos items
/// @desc 6 structs concretos que implementan la "interfaz"
function obj_boots(_type, _score= 0) : IAction() constructor {
    points = _score
	type = _type
    action = function() {
        show_debug_message("Botas");
    };
}

function obj_shield(_type, _score= 0) : IAction() constructor {
    points = _score
	type = _type
    action = function() {
        show_debug_message("Shield");
    };
}

function obj_potion(_type,_score= 0) : IAction() constructor {
    points = _score   
	type = _type
	action = function() {
        show_debug_message("Poción");
    };
}

function obj_star(_type, _score= 0) : IAction() constructor {
    points = _score
	type = _type
	action = function() {
        show_debug_message("Star");
    };
}

function obj_bomb(_type,_score= 0) : IAction() constructor {
	points = _score
	type = _type
	action = function() {
        show_debug_message("Bomba");
    };
}

function obj_magnet(_type,_score= 0) : IAction() constructor {
    points = _score
	type = _type
	action = function() {
        show_debug_message("Magnet");
    };
}

function obj_resource(_type,_score= 10) : IAction() constructor {
	points = _score
	type = _type
    action = function() {
        show_debug_message("RECURSO OMG");
    };
}
#endregion

#region Objects Factory
/// @desc 6 fábricas concretas usando ActionFactory
function factory_boots() : ActionFactory() constructor {
    create_object = function() {
        return new obj_boots(item_botas);
    };
}

function factory_shield() : ActionFactory() constructor {
    create_object = function() {
        return new obj_shield(item_escudo);
    };
}

function factory_potion() : ActionFactory() constructor {
    create_object = function() {
        return new obj_potion(item_potion);
    };
}

function factory_star() : ActionFactory() constructor {
    create_object = function() {
        return new obj_star(item_star);
    };
}

function factory_bomb() : ActionFactory() constructor {
    create_object = function() {
        return new obj_bomb(item_bomb);
    };
}

function factory_magnet() : ActionFactory() constructor {
    create_object = function() {
        return new obj_magnet(item_magnet);
    };
}

function factory_resource() : ActionFactory() constructor {
    create_object = function() {
        return new obj_resource(item_resource, 10);
    };
}

function factory_Bigresource() : ActionFactory() constructor {
    create_object = function() {
        return new obj_resource(item_resource, 25);
    };
}
#endregion
