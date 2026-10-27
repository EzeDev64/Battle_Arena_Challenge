var _id = ds_map_find_value(async_load, "id");
if (_id == username)
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
            global.user.username = ds_map_find_value(async_load, "result");
			//show_message(global.user.username)
			//room_goto(test_server_room)
        }
    }
}

if (_id == password)
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
            show_message("Holaa")
			var _a = instance_create_depth(0,0,1,obj_client)
			_a.alarm[0] = 30
			_a.password = ds_map_find_value(async_load, "result");
			//room_goto(test_server_room)
        }else{
			show_message("Campos no deben ir vacíos")
			game_end()
		}
    }
}

if (_id == create_password)
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") == "")
        {
			show_message("Campos no deben ir vacíos")
			game_end()
		}else{
			var _a = instance_create_depth(0,0,1,obj_client)
			_a.password = ds_map_find_value(async_load, "result");
		}
    }
}

if (_id == mail)
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
			//password = ds_map_find_value(async_load, "result");
			var _a = instance_find(obj_client,0)
			_a.alarm[1] = 30
			_a.mail = ds_map_find_value(async_load, "result");
        }else{
			show_message("Campos no deben ir vacíos")
			game_end()
		}
    }
}

if (_id == verification_code)
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
			//password = ds_map_find_value(async_load, "result");
			var _a = instance_find(obj_client,0)
			if  ds_map_find_value(async_load, "result") == _a.code{
				_a.alarm[2] = 30
			}else{
				show_message("Error código no es el solicitado")
				game_end()
			}
        }else{
			show_message("Campos no deben ir vacíos")
			game_end()
		}
    }
}