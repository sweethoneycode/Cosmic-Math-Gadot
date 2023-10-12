extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func changeMusic(var Song):
	match Song:
		"track1":
			SoundManager.play_bgm("Space")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
