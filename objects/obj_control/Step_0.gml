http_get("http://localhost:5000/obtener-estado");

#region Keyboard controls
if keyboard_check(vk_up){
	keypad_up = true	
}else{
	keypad_up = false		
}

if keyboard_check(vk_down){
	keypad_down = true	
}else{
	keypad_down = false		
}

if keyboard_check(vk_left){
	keypad_left = true	
}else{
	keypad_left = false		
}

if keyboard_check(vk_right){
	keypad_right = true	
}else{
	keypad_right = false		
}
#endregion