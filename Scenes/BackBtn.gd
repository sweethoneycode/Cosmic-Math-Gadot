extends TextureButton

onready var scene

func _on_BackBtn_pressed():
	SoundManager.play_se("Back")
	scene = PlayerVariables.currScene
	
	match scene:
		
		"LevelSelect":
			BackgroundLoad.load_scene("res://Scenes/Planets.tscn")
		"MathStage":
			BackgroundLoad.load_scene("res://Scenes/LevelSelect.tscn")
		"Planets":
			BackgroundLoad.load_scene("res://main.tscn")
		"Settings":
			get_tree().change_scene("res://main.tscn")
