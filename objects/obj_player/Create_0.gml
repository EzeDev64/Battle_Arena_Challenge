user_name = global.user;
vel = 2;
positionX = 0;
positionY = 0;
tilemap = layer_tilemap_get_id("Tiles_Col");
move_enabled = 0
sprite_index = spr_player_1_down_idle;

//Agregados nuevos
depth = -999
points = 0
mediator = instance_find(obj_game_mannager,0)

// ---------- Efectos de items (cada uno guarda hasta cuando dura, en ms) ----------
boost_until   = 0;     // botas: mas velocidad
shield_until  = 0;     // escudo: inmune
star_until    = 0;     // estrella: aturde al rival que toque
stun_until    = 0;     // aturdido: no se puede mover
double_until  = 0;     // pocion: recursos valen el doble
star_cooldown = 0;     // para no aturdir al mismo rival en cada frame
magnet_range  = 350;   // alcance del iman (px)

client = instance_find(obj_client, 0);

// Mina terrestre (item bomba): la deja en el suelo y avisa a los rivales
place_mine = function() {
    var _mx = (bbox_left + bbox_right) / 2;
    var _my = (bbox_top + bbox_bottom) / 2;
    var _id = string(global.user) + "_" + string(current_time);

    var _m = instance_create_layer(_mx, _my, "Instances", obj_mina);
    _m.propietario = global.user;
    _m.mina_id = _id;

    client.send_effect("all", "mine_placed", 0, _mx, _my, _id);
};

// Iman (item iman): roba el recurso del rival mas cercano
use_magnet = function() {
    var _rival = instance_nearest(x, y, obj_npc);
    if (_rival != noone && point_distance(x, y, _rival.x, _rival.y) <= magnet_range) {
        client.send_effect(_rival.username, "steal");
    }
    else {
        show_debug_message("Iman: no hay rivales cerca");
    }
};

// Efectos que llegan de otros jugadores (los reenvia obj_client)
apply_effect = function(_efecto, _desde, _datos) {
    switch (_efecto) {

        case "star_stun":
            // El escudo protege; y si el que recibe tambien tiene estrella, no pasa nada
            if (current_time < shield_until || current_time < star_until) break;
            stun_until = max(stun_until, current_time + 3000);
            break;

        case "steal":
            // El escudo protege. Si lleva un recurso, se lo quitan y se lo mandan al ladron
            if (current_time < shield_until) break;
            var _pts = obj_inventory.take_resource();
            if (_pts > 0) client.send_effect(_desde, "give_resource", _pts);
            break;

        case "give_resource":
            obj_inventory.receive_resource(_datos.value);
            break;

        case "mine_placed":
            var _m = instance_create_layer(_datos.x, _datos.y, "Instances", obj_mina);
            _m.propietario = _desde;
            _m.mina_id = _datos.mina_id;
            break;

        case "mine_exploded":
            var _id_mina = _datos.mina_id;
            with (obj_mina) {
                if (mina_id == _id_mina) instance_destroy();
            }
            break;
    }
};
