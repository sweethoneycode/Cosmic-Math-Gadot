extends Sprite

export var planetSpeed := 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_speed(speed:int):
	planetSpeed = speed
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += planetSpeed * delta / 4
