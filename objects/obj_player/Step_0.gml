// Dirección de entrada: -1, 0 o 1
positionX = keyboard_check(vk_right) - keyboard_check(vk_left);
positionY = keyboard_check(vk_down) - keyboard_check(vk_up);

// Desplazamiento en píxeles por frame
vel = 3.5
tilemap = layer_tilemap_get_id("Tiles_Col");
var _dx = vel * positionX * move_enabled;
var _dy = vel * positionY * move_enabled;

// Diagonal a la misma velocidad que en línea recta
if (_dx != 0 && _dy != 0) {
    _dx *= 0.7071;
    _dy *= 0.7071;
}

// move_and_collide ya mueve la instancia; no uses x += aquí
move_and_collide(_dx, _dy, tilemap);

// Selección de sprite según la dirección de entrada
if (positionX != 0 || positionY != 0) {
    if (positionY > 0) sprite_index = spr_player_1_down;
    else if (positionY < 0) sprite_index = spr_player_1_up;
    else if (positionX > 0) sprite_index = spr_player_1_right;
    else sprite_index = spr_player_1_left;
	mediator.notify(id,"user_move")
} else {
    if (sprite_index == spr_player_1_right) sprite_index = spr_player_1_right_idle;
    else if (sprite_index == spr_player_1_left) sprite_index = spr_player_1_left_idle;
    else if (sprite_index == spr_player_1_up) sprite_index = spr_player_1_up_idle;
    else if (sprite_index == spr_player_1_down) sprite_index = spr_player_1_down_idle;
}

//user_name = global.user.username;

// Estrella: aturde al rival que toque (el rival decide si le afecta)
if (current_time < star_until && current_time >= star_cooldown) {
    var _rival = instance_place(x, y, obj_npc);
    if (_rival != noone) {
        star_cooldown = current_time + 1500;
        client.send_effect(_rival.username, "star_stun");
    }
}
