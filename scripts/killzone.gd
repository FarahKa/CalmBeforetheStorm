extends Area2D


@onready var game_manager: Node = %GameManager


func _on_body_entered(body: Node2D) -> void:
	if body.name != "Dog":
		body.queue_free()
		
		#print("1 sheep lost sad dogo noise")
		game_manager.add_death()
