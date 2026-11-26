var _id = ds_map_find_value(async_load, "id");
if (_id == chat_async_id) {
    if (ds_map_find_value(async_load, "status")) {
        var _input = ds_map_find_value(async_load, "result");
        if (is_string(_input) && _input != "") {
            chat_text = _input;
        }
    }
    chat_async_id = -1;
}