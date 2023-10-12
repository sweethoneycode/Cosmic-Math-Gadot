extends Node2D

var _save: SaveGame
onready var StageStars := $StageStars
onready var Rocket := $Rocket/AnimationPlayer
var stars
var starCount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.stop("Stage")
	SoundManager.play_bgm("Space")
	
	_save = SaveGame.load_savegame()
	stars = PlayerVariables.stageStars
	Rocket.play("Flying")
	$Timer.start()

func showStars():
	if stars > 0:
		SoundManager.play_se("Star")
		for star in StageStars.get_children():
			if(int(star.name) == starCount):
				star.show()
				
		if(starCount == stars):
			$Timer2.start()
			PlayerVariables.stageStars = 0
	else:
		$Timer2.start()
		PlayerVariables.stageStars = 0

func next_stage():
	get_tree().change_scene("res://Scenes/LevelSelect.tscn")


func _on_Timer_timeout():
	starCount = starCount + 1
	showStars()


func _on_Timer2_timeout():
	SoundManager.stop("Rocket")
	next_stage()
