extends Area2D
const TARGET_Y = 170#160
const SPAWN_Y = -7
const DIST_TO_TARGET = TARGET_Y - SPAWN_Y

const POSE_1 = Vector2(182, SPAWN_Y)
const POSE_2 = Vector2(200, SPAWN_Y)
const POSE_3 = Vector2(216, SPAWN_Y)
const POSE_4 = Vector2(233, SPAWN_Y)

const Px1 = 170 - 5
const Px2 = 195 - 1
const Px3 = 221 + 1
const Px4 = 246 + 5


var hit = false
var speed
var speedx = 0

func _ready():
	$Timer2.start()
	


func _physics_process(delta):
	if !hit:
		position.y += speed * delta
		position.x += speedx * delta
		if position.y > 200:
			queue_free()


func initialize(lane,x):
	if lane == 0:
		if x:
			$AnimatedSprite2D.frame = 4
		else:
			$AnimatedSprite2D.frame = 0
		position = POSE_1
		speedx = (Px1 - POSE_1.x)*0.4
	elif lane == 1:
		if x:
			$AnimatedSprite2D.frame = 4
		else:
			$AnimatedSprite2D.frame = 1
		position = POSE_2
		speedx = (Px2 - POSE_2.x)*0.4
	elif lane == 2:
		if x:
			$AnimatedSprite2D.frame = 4
		else:
			$AnimatedSprite2D.frame = 2
		position = POSE_3
		speedx = (Px3 - POSE_3.x)*0.4
	elif lane == 3:
		if x:
			$AnimatedSprite2D.frame = 4
		else:
			$AnimatedSprite2D.frame = 3
		position = POSE_4
		speedx = (Px4 - POSE_4.x)*0.4
	else:
		printerr("Invalid lane set for note: " + str(lane))
		return
	
	speed = DIST_TO_TARGET / 2.0




func destroy(score):
	$CPUParticles2D.emitting = true
	$AnimatedSprite2D.visible = false
	$Timer.start()
	hit = true
	if score == 3:
		$Node2D/Label.text = "GREAT"
		if not Geral.esp:
			$Node2D/Label.modulate = Color("00f46d")
	elif score == 2:
		$Node2D/Label.text = "GOOD"
		if not Geral.esp:
			$Node2D/Label.modulate = Color("0e75f4")
	elif score == 1:
		$Node2D/Label.text = "OKAY"
		if not Geral.esp:
			$Node2D/Label.modulate = Color("f4aa1a")


func _on_timer_timeout():
	queue_free()
	pass 


func _on_timer_2_timeout():
	if scale < Vector2(1,1):
		scale += Vector2(0.01,0.01)
	pass # Replace with function body.
func color(cor):
	$Node2D/Label.modulate = Color(cor)
