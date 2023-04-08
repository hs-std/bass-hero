extends Node2D
var score = 0
var combo = 0
var esp = false
var valor = 0

signal especial
signal off_especial
signal menos


func _on_menos():
	emit_signal("menos")
	pass


func _on_especial():
	esp = true
	emit_signal("especial")
	pass 

func _on_off_especial():
	esp = false
	emit_signal("off_especial")
	pass 

func increment_score(by):
	if by > 0:
		combo += 1
		if valor < 100:
			if not esp:
				valor += float(by)/2
				Geral.val = valor
			else:
				valor = 0
	else:
		combo = 0
		if valor > 0:
			if not esp:
				valor -= 5/5
				Geral.val = valor
			else:
				valor = 0
	if esp:
		score += (by * combo) * 3
	else:
		score += by * combo
	Geral.sce = score
	
