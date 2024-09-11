extends AnimatedSprite2D

@onready var player: CharacterBody2D = $".."

func _play() :
	if player.player_status == "moving" :
		play("run")
	else :
		play("idle")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
