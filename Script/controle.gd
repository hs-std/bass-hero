extends Node2D
var s 
var stop



func _ready():
	stop = false
	s = 5
	$Timer.start()

func _process(delta):
	$Label.text = str(s)
	if s < 0:
		get_tree().change_scene_to_file("res://Scene/jogo.tscn")
	
func _on_timer_timeout():
	if !stop:
		s -= 1
	pass


func _on_button_button_down():
	stop = true
	pass 

func _on_button_button_up():
	stop = false
	pass
