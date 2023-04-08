extends Control


func _on_button_pressed():
	$Slap.play()



func _on_slap_finished():
	get_tree().change_scene_to_file("res://Scene/controle.tscn")
	queue_free()

