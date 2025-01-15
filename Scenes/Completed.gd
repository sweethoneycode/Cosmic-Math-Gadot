extends Node2D

onready var StageStars := $StageStars
onready var Rocket := $Rocket/AnimationPlayer
export var stars := 0
var starCount := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	stars = PlayerVariables.stageStars
	Rocket.play("Flying")
	$Timer.start()

func showStars():
	if stars > 0:
		for star in StageStars.get_children():
			if(int(star.name) == starCount):
				star.show()
				
		if(starCount == stars):
			SoundManager.stop("Star")
			$Timer2.start()
			$Timer.stop()
			PlayerVariables.stageStars = 0
	else:
		$Timer2.start()
		PlayerVariables.stageStars = 0

func next_stage():
	get_tree().change_scene("res://Scenes/LevelSelect.tscn")
	
func _on_Timer_timeout():
	if(starCount < stars):
		SoundManager.play_se("Star")
		starCount = starCount + 1
	showStars()	
	
func _on_Timer2_timeout():
	SoundManager.stop("Rocket")
	next_stage()
