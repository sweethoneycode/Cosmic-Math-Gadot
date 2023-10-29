extends Button

var currentLevel
var currMath
onready var levelNum := $Label
var mathType = "+"
onready var levelTXt := $"%levelTXT"

var stats: StageStats setget set_stats
# Called when the node enters the scene tree for the first time.
func _ready():
	currentLevel = self.name	
	checkStage()

func set_stats(new_stats: StageStats) -> void:
	stats = new_stats

func checkStage():
	mathType = PlayerVariables.stage
	
	levelNum.text = str(currentLevel)
	
	match mathType:
		"+":
			if(PlayerVariables.AdditionUnlock.get(currentLevel) == 1):
				var stars = PlayerVariables.AdditionComplete.get(currentLevel)
				loadStars(stars)
			else:
				self.disabled = true
			currMath = "addition"
		"-":
			if(PlayerVariables.SubtractionUnlock.get(currentLevel) == 1):
				var stars = PlayerVariables.SubtractionComplete.get(currentLevel)
				loadStars(stars)
			else:
				self.disabled = true
			currMath = "subtraction"
		"x":
			if(PlayerVariables.MultiplicationUnlock.get(currentLevel) == 1):
				var stars = PlayerVariables.MultiComplete.get(currentLevel)
				loadStars(stars)
			else:
				self.disabled = true
			currMath = "multiplication"
		"÷":
			if(PlayerVariables.DivisionUnlock.get(currentLevel) == 1):
				var stars = PlayerVariables.DivisionComplete.get(currentLevel)
				loadStars(stars)
			else:
				self.disabled = true
					
			if(self.name == str(0)):
				self.disabled = true

			currMath = "division"
		_:
			currMath = "addition"
			
	var text = currMath + " Level"
	levelTXt.text = text.capitalize()
	

func loadStars(stars):
	if(stars != null):
		for star in $stars.get_children():
			if(int(star.name) <= stars):
				star.show()

func _on_Level_pressed():
	SoundManager.play_se("Select")
	PlayerVariables.levelStart = int(levelNum.text)
	BackgroundLoad.load_scene("res://Scenes/MathStage.tscn")
