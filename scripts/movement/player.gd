extends CharacterBody2D

@export var speed = 300

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var input_direction
var direction
var input_action
	
func _physics_process(_delta):
	get_input()
	move_and_slide()
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction > 0 :
		$AnimatedSprite2D.flip_h = false
	elif direction < 0 :
		$AnimatedSprite2D.flip_h = true
	if input_action :
		var is_barking = "true"
		if direction == 0 :
			$AnimatedSprite2D.play("idle_bark")
		elif direction != 0 :
			$AnimatedSprite2D.play("run_bark")
	else :
		if direction == 0 :
			$AnimatedSprite2D.play("idle")
		else :
			$AnimatedSprite2D.play("run")

func get_input():
	input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	input_action = Input.is_action_pressed("ui_select")
	
	
	#print (input_action)
