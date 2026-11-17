var _async_id = async_load[? "id"];
var _status = async_load[? "status"];

/*
if (_status == 0) {
    var _result = async_load[? "result"];
    show_debug_message("SE CONECTÓ ALGO!!!")
}
*/

if (async_load[? "status"] == 0) {
	var _result = async_load[? "result"];
	show_debug_message(_result)
    var _json = json_parse(_result);
    show_debug_message("SE CONECTÓ ALGO!!!")
}