var _min = int64(time/60)
var _seg = time

if _seg == 60{
	_seg = 0
}else if _seg > 60{
	_seg = _seg-60	
}


draw_text(view_get_wport(view_camera[0])-10,10,$"{_min}:{_seg}")
if instance_exists(obj_player){
	draw_text(view_get_wport(view_camera[0])-100,10,$"Score: {obj_player.points}")
}