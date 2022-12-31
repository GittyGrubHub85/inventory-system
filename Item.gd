extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	if randi() % 2 == 0:
		$TextureRect.texture = load("res://Apple_0.png")
	else:
		$TextureRect.texture = load("res://12x8 pixel art empty potion model 0.png")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
