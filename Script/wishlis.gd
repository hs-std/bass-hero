extends Control


func _on_button_mouse_entered():
	modulate = Color("ffe932")

func _on_button_mouse_exited():
	modulate = Color("ffffff")
	
func _on_button_button_down():
	modulate = Color("565656")
	
func _on_button_button_up():
	modulate = Color("ffffff")
 



func _on_button_pressed():
	OS.shell_open("https://store.steampowered.com/app/1938030/Caution/")
	
