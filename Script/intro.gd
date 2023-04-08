extends Control

func _ready():
	DisplayServer.window_set_flag(2,true,0)
	DisplayServer.window_set_size(Vector2(1280,720),0)
	
	



func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scene/menu.tscn")
