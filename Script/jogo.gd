extends Node2D
@onready var note = load("res://Scene/note.tscn")
@onready var resu = load("res://Scene/resu.tscn")
@onready var sdaiay = Audios.get_node("AudioStreamPlayer")
var instance
var esp = false
var pon = 0
var max = 150000

func _ready():
	if sdaiay.is_playing:
		sdaiay.stop()
	esp = false
	$ColorRect.modulate = Color("ffffff00")

func spawn(lane):
	if esp:
		instance = note.instantiate() 
		instance.initialize(lane, true)
		instance.color("20d9ff")
		instance.scale = Vector2(0.6,0.6)
		add_child(instance)
	else:
		instance = note.instantiate() 
		instance.initialize(lane, false)
		instance.scale = Vector2(0.6,0.6)
		add_child(instance)


func _on_ms_beat(position):
	spawn(position)
	pass


func _on_bass_especial():
	if not esp: 
		$AnimationPlayer.play("esp")
		$PointLight2D.enabled = true
		Geral.esp = true
	esp = true
	pass 


func _on_bass_off_especial():
	if esp: 
		$AnimationPlayer.play("esp")
		$PointLight2D.enabled = false
		Geral.esp = false
	esp = false
	pass 

func _process(delta):
	$Ponts.text = String("Points: ") + str(Geral.sce)
	$ProgressBar.value = pon
	var t = randf_range(1,1.3)
	$PointLight2D.energy = t


func _on_ms_finished():
	$PointLight2D.enabled = false
	if Geral.sce > max*0.7:
		end("You heve a Big PP!","Amazing bass player!")
		$APLAUSOS.play()
		$EP.play()
	elif Geral.sce > max*0.5:
		end("Epic","Epic bass player!")
		$APLAUSOS.play()
		$EP.play()
	elif Geral.sce > max*0.3:
		end("Nice","Good bass player!")
		$APLAUSOS.play()
		$APROVD.play()
	elif Geral.sce > max*0.1:
		end("OMG","Beginner bass player!")
		$OMG.play()
		$APLAUSOS.play()
	elif Geral.sce < max*0.1:
		end("Small pp","You play the violin!")
		$APLAUSOS.play()
		$APROVD.play()
	pass 


func _on_area_2d_area_entered(area):
#	$Bass.increment_score(1) #Teste
	pon += 1
	if pon > 30:
		$PointLight2D.enabled = false
		end("Unbelievable","You play the violin!")
		$VAIA.play()
		$UN.play()
	pass # Replace with function body.

func end(tex,w):
	var e = resu.instantiate() 
	add_child(e)
	e.tex(tex,str(Geral.sce),w)
	get_tree().paused = true
	$MS.stop()
	


func _on_bass_menos():
	if pon > 0:
		pon -= 1
	pass 
