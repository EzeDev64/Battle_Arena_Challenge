if focus{
	if (keyboard_key == vk_backspace) {
		text = string_delete(text, string_length(text), 1);
	}else if (string_length(keyboard_lastchar) > 0 and keyboard_key != vk_shift and keyboard_key != vk_ralt) {
		text  += keyboard_lastchar;
	}
}