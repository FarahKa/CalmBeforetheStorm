extends CharacterBody2D

@export var speed = 300

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var input_direction
var last_direction

func _physics_process(_delta):
	get_input()
	move_and_slide()
	

func get_input():
	input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	if velocity :
		if velocity.x > 0 :
			$AnimatedSprite2D.flip_h = true
			const last_direction = "left"
		elif velocity.x < 0 :
			$AnimatedSprite2D.flip_h = false
			const last_direction = "right"
	if input_direction :
		if input_direction.x == 0 && input_direction.y == 0 :
			const player_status = "idle"
			print (player_status)

		else :
			const player_status = "moving"
			print (player_status)
