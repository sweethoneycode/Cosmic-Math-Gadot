extends Button

var _save: SaveGame

var currentLevel
var currMath
onready var levelNum := $Label
var mathType = "+"
onready var levelTXt := $"%levelTXT"

# Called when the node enters the scene tree for the first time.
func _ready():
	currentLevel = self.name

	_save = SaveGame.load_savegame()
	
	checkStage()
	
func checkStage():
	mathType = PlayerVariables.stage
	
	levelNum.text = str(currentLevel)
	
	match mathType:
		"+":
			if(!_save.AdditionComplete.empty()):
				if(_save.AdditionUnlock.get(currentLevel) == 1):
					var stars = _save.AdditionComplete.get(currentLevel)
					for star in $stars.get_children():
						if(int(star.name) <= stars):
							star.show()
				else:
					self.disabled = true
			currMath = "addition"
		"-":
			if(!_save.SubtractionComplete.empty()):
				if(_save.SubtractionComplete.get(currentLevel) == 1):
					var stars = _save.SubtractionComplete.get(currentLevel)
					for star in $stars.get_children():
						if(int(star.name) <= stars):
							star.show()
				else:
					self.disabled = true
			currMath = "subtraction"
		"x":
			if(!_save.MultiComplete.empty()):
				if(_save.MultiplicationUnlock.get(currentLevel) == 1):
					var stars = _save.MultiComplete.get(currentLevel)
					for star in $stars.get_children():
						if(int(star.name) <= stars):
							star.show()
				else:
					self.disabled = true
			currMath = "multiplication"
		"÷":
			if(!_save.DivisionComplete.empty()):
				if(_save.DivisionUnlock.get(currentLevel) == 1):
					var stars = _save.DivisionComplete.get(currentLevel)
					print(stars)
					for star in $stars.get_children():
						if(int(star.name) <= stars):
							star.show()
				else:
					self.disabled = true
					
			if(self.name == str(0)):
				self.disabled = true

			currMath = "division"
		_:
			currMath = "addition"
			
	var text = currMath + " Level"
	levelTXt.text = text.capitalize()
	

	#load stars

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	mathType = PlayerVariables.stage


func _on_Level_pressed():
	SoundManager.play_se("Select")
	PlayerVariables.levelStart = int(levelNum.text)
	get_tree().change_scene("res://Scenes/MathStage.tscn")
