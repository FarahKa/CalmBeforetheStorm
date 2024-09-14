extends Node
@onready var dead: Label = $Dead

@onready var gameover: Label = $GAMEOVER
@onready var timer: Timer = $Timer
@onready var time_left: Label = $TimeLeft

var dead_nb = 0
var max
@onready var sheepz: Node = $"../Sheepz"

func _ready() -> void:
	max = sheepz.get_child_count()
	
	
	
func _process(delta: float) -> void:
	print(timer.time_left)
	time_left.text=(str(int(timer.time_left)) + " SECONDS BEFORE THE STORM")
	if timer.time_left == 5:
		Engine.time_scale = 0.5
	if timer.time_left == 0:
		Engine.time_scale = 0
		gameover.text = "STORM IS HERE.\n" + str(max-dead_nb) + " SHEEP LEFT."
		gameover.visible = true

func add_death():
	dead_nb += 1
	print(dead_nb)
	dead.text=str(dead_nb) + " SHEEP DIED"
	if dead_nb == max:
		print("game over")
		gameover.visible = true
