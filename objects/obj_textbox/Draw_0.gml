draw_self()		
draw_text(x,y-20,title)
if string_pos("password",class){
	draw_text(x,y,string_repeat("*", string_length(text)))
}else{
	draw_text(x,y,text)
}

