// En el evento que desees (por ejemplo, al presionar una tecla o en un intervalo)
var _url = "http://localhost:5000/";
var _map = ds_map_create();
ds_map_add(_map, "accion", "activar_mecanismo");
ds_map_add(_map, "jugador_id", "jugador_1");

var _string = json_encode(_map);
ds_map_destroy(_map);

// Realiza la petición POST HTTP
var _headers = ds_map_create();
ds_map_add(_headers, "Content-Type", "application/json");

http_request(_url, "POST", _headers, _string);
ds_map_destroy(_headers);