extends TextureProgressBar
var esp = false
@onready var esp_e = load("res://Sprites/PE2.png")
@onready var esp_f = load("res://Sprites/PE1.png")
@onready var off_e = load("res://Sprites/Panel1.png")
@onready var off_f = load("res://Sprites/Panel2.png")
signal especial
signal off_especial




func _process(delta):
	value = Geral.val
#	if value == 100: #Teste
#		emit_signal("especial") #Teste
#		esp = true #Teste
	if value > 50:
		if Input.is_action_pressed("space"):
			emit_signal("especial")
			esp = true
	if value == 0:
		emit_signal("off_especial")
		esp = false
	if esp:
		if Geral.val > 0:
			Geral.val -= 3*delta
		elif Geral.val < 0:
			Geral.val = 0
		texture_under = esp_e
		texture_progress = esp_f
	else:
#		modulate = Color("ffffff")
		texture_under = off_e
		texture_progress = off_f
