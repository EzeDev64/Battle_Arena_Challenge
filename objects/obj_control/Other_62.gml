if (async_load[? "status"] == 0 && async_load[? "http_status"] == 200) {
    var _result = async_load[? "result"];
    show_debug_message(_result);

    var _json = json_parse(_result);
    if (is_struct(_json)) {
        control_up    = (_json[$ "up"]  ?? 0) == 1;
        control_down  = (_json[$ "down"]   ?? 0) == 1;
        control_left  = (_json[$ "left"]     ?? 0) == 1;
        control_right = (_json[$ "right"] ?? 0) == 1;
    }
}