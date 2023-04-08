extends Node2D

func tex(tit,pt,dd):
	$ColorRect2.visible = true
	$Sprite2D/wd.text = tit
	$Sprite2D/pts.text = pt
	$Sprite2D/pts2.text = dd


func _on_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scene/controle.tscn")
	pass 
