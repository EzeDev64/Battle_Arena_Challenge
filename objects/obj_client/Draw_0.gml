var _dy = 30
draw_text(0,0,$"Mi user:{global.user.username}")
draw_text(0,15,$"Lista de usuarios conectados")
for (i = 0;i<array_length(user_names);i++){
	draw_text(0,_dy,user_names[i].username)
}