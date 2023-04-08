extends ProgressBar

func _ready():
	pass # Replace with function body.

func _process(delta):
	$Sprite2D.position.y = (value*2.2)
	pass
