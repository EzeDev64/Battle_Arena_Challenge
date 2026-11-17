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