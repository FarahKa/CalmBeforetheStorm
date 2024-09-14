extends CharacterBody2D

var start_position
var target_position 
@onready var dog: CharacterBody2D = $"../../Dog"

func _ready() -> void:
	start_position = global_position
	target_position = global_position
	velocity = Vector2.ZERO
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
enum {
	IDLE,
	WANDER
}


var state = IDLE

const ACCELERATION = 300
const MAX_SPEED = 20
const TOLERANCE = 4.0
const SPEED_AWAY =  50


func _physics_process(delta):
	match state:
		IDLE:
			state = WANDER
			# Maybe wait for X seconds with a timer before moving on
			update_target_position()
		WANDER:
			if velocity == Vector2.ZERO:
				state = IDLE
				pass
				
			#print(velocity)
			
			accelerate_to_point(target_position, ACCELERATION * delta)
			#print(global_position.distance_to(dog.global_position))
			#print(velocity)

				
			if global_position.distance_to(dog.global_position) < 100:
				var direction = global_position.direction_to(dog.global_position)
				velocity = -direction * SPEED_AWAY
				target_position = global_position - direction 
				
			
			if is_at_target_position():
				state = IDLE

	move_and_slide()

func update_target_position():
	var target_vector = Vector2(randf_range(-200, 200), randf_range(-200, 200))
	target_position = start_position + target_vector

func is_at_target_position(): 
	# Stop moving when at target +/- tolerance
	return (target_position - global_position).length() < TOLERANCE

func accelerate_to_point(point, acceleration_scalar):
	var direction = (point - global_position).normalized()
	var acceleration_vector = direction * acceleration_scalar
	velocity += acceleration_vector
	velocity = velocity.limit_length(MAX_SPEED)

	
