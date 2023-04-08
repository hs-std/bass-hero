extends Sprite2D
@onready var pai = get_node("../TP")
var perfect = false
var good = false
var okay = false
var current_note = null
var mes = 0
signal menos

@export var input = ""


func _unhandled_input(event):
	if event.is_action(input):
		if event.is_action_pressed(input, false):
			self.visible = true
			if current_note != null:
				if perfect:
					mes += 1
					get_parent().increment_score(3)
					current_note.destroy(3)
				elif good:
					mes += 1
					get_parent().increment_score(2)
					current_note.destroy(2)
				elif okay:
					mes += 1
					get_parent().increment_score(1)
					current_note.destroy(1)
				_reset()
			else:
				get_parent().increment_score(0)
				
		else:
			self.visible = false
		if event.is_action_pressed(input):
			frame = 1

func _reset():
	current_note = null
	perfect = false
	good = false
	okay = false

func _process(delta):
	if mes > 9:
		emit_signal("menos")
		mes = 0

func _on_perfect_area_entered(area):
	if area.is_in_group("note"):
		perfect = true
func _on_perfect_area_exited(area):
	if area.is_in_group("note"):
		perfect = false


func _on_good_area_entered(area):
	if area.is_in_group("note"):
		good = true
func _on_good_area_exited(area):
	if area.is_in_group("note"):
		good = false


func _on_okay_area_entered(area):
	if area.is_in_group("note"):
		okay = true
		current_note = area
func _on_okay_area_exited(area):
	if area.is_in_group("note"):
		okay = false
		current_note = null

