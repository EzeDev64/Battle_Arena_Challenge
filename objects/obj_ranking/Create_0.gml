// ---------- Leer el ranking ----------
lista = [];
es_demo = false;

var fuente = [];
if (variable_global_exists("ranking") && is_array(global.ranking)) {
    fuente = global.ranking;
}

for (var i = 0; i < min(array_length(fuente), 8); i++) {
    var e = fuente[i];
    var nombre = "Jugador " + string(i + 1);
    var puntos = 0;

    if (is_struct(e)) {
        if (variable_struct_exists(e, "username")) nombre = string(e.username);
        else if (variable_struct_exists(e, "name")) nombre = string(e.name);

        if (variable_struct_exists(e, "score")) puntos = e.score;
        else if (variable_struct_exists(e, "points")) puntos = e.points;
    }

    array_push(lista, { nombre: nombre, puntos: puntos });
}

// Datos de ejemplo solo si no llego nada
if (array_length(lista) == 0) {
    es_demo = true;
    lista = [
        { nombre: "ShadowFox",  puntos: 420 },
        { nombre: "NeoBlitz",   puntos: 310 },
        { nombre: "LunaStrike", puntos: 180 }
    ];
}

// ---------- Nombre del jugador actual (para resaltarlo) ----------
mi_nombre = "";
if (variable_global_exists("user")) {
    if (is_struct(global.user) && variable_struct_exists(global.user, "username")) {
        mi_nombre = string(global.user.username);
    }
    else if (is_string(global.user)) {
        mi_nombre = global.user;
    }
}

// ---------- Colores ----------
col_azul   = make_color_rgb(40, 130, 220);
col_azul_h = make_color_rgb(75, 160, 245);
col_texto  = make_color_rgb(200, 190, 230);
col_oro    = make_color_rgb(255, 205, 60);
col_plata  = make_color_rgb(200, 205, 218);
col_bronce = make_color_rgb(205, 130, 70);

// ---------- Posiciones ----------
cx = room_width / 2;
panel = [cx - 360, 40, cx + 360, 680];

t_inicio = current_time;
depth = 50;   // se dibuja encima del fondo negro, pero debajo del obj_volver
