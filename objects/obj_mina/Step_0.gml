if (!explotada) {
    if (!armada && current_time >= armar_en) armada = true;

    // Solo explota con el jugador de ESTE cliente, si no es el dueno y no tiene escudo
    if (armada && instance_exists(obj_player) && propietario != global.user) {
        var _p = obj_player;
        var _px = (_p.bbox_left + _p.bbox_right) / 2;
        var _py = (_p.bbox_top + _p.bbox_bottom) / 2;

        if (point_distance(x, y, _px, _py) < 24 && current_time >= _p.shield_until) {
            explotada = true;
            t_explosion = 0;

            // Aturde 2.5 s y avisa a los demas para que quiten la mina
            _p.stun_until = max(_p.stun_until, current_time + 2500);
            _p.client.send_effect("all", "mine_exploded", 0, 0, 0, mina_id);
        }
    }
}
else {
    t_explosion += 1;
    if (t_explosion > 30) instance_destroy();
}
