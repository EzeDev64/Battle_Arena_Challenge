if (keyboard_check(vk_right)){
	positionX = 1
}else if (keyboard_check(vk_left)){
	positionX = -1
}else{
	positionX= 0	
}

if (keyboard_check(vk_down)){
	positionY = 1
}else if (keyboard_check(vk_up)){
	positionY = -1
}else{
	positionY = 0	
}

x += vel*positionX
y += vel*positionY