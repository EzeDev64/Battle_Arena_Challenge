var _id = ds_map_find_value(async_load, "id");
if (_id == msg)
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
            global.user.username = ds_map_find_value(async_load, "result");
			//show_message(global.user.username)
			room_goto(test_server_room)
        }
    }
}