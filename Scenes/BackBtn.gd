extends TextureButton

export onready var scene

func _on_BackBtn_pressed():
	SoundManager.play_se("Back")
	scene = PlayerVariables.currScene
	print(scene)
	
	match scene:
		
		"LevelSelect":

			get_tree().change_scene("res://Scenes/Planets.tscn")
		"MathStage":
			SoundManager.stop("Stage")
			SoundManager.play_bgs("Space")
			get_tree().change_scene("res://Scenes/LevelSelect.tscn")
		"Planets":
			get_tree().change_scene("res://main.tscn")
		"Settings":
			get_tree().change_scene("res://main.tscn")	
