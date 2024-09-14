extends Node
@onready var dead: Label = $Dead

@onready var gameover: Label = $GAMEOVER

var dead_nb = 0
var max
@onready var sheepz: Node = $"../Sheepz"

func _ready() -> void:
	max = sheepz.get_child_count()
	
func add_death():
	dead_nb += 1
	print(dead_nb)
	dead.text=str(dead_nb) + " SHEEP DIED"
	if dead_nb == max:
		print("game over")
		gameover.visible = true
