extends Button

var _save: SaveGame

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var currentLevel
var currMath
onready var levelNum := $Label
var mathType = "+"
onready var levelTXt := $"%levelTXT"

# Called when the node enters the scene tree for the first time.
func _ready():
	currentLevel = self.name
	_create_or_load_save() #load saved game
	checkStage()

func _create_or_load_save() -> void:
	if SaveGame.save_exists():
		_save = SaveGame.load_savegame()
		
func checkStage():
	mathType = PlayerVariables.stage
	
	levelNum.text = currentLevel
	
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
				if(_save.SubtractionComplete.has(currentLevel)):
					var stars = _save.SubtractionComplete.get(currentLevel)
					for star in $stars.get_children():
						if(int(star.name) <= stars):
							star.show()
				else:
					self.disabled = true
			currMath = "subtraction"
		"x":
			if(!_save.MultiComplete.empty()):
				if(_save.MultiComplete.has(currentLevel)):
					var stars = _save.MultiComplete.get(currentLevel)
					for star in $stars.get_children():
						if(int(star.name) <= stars):
							star.show()
				else:
					self.disabled = true
			currMath = "multiplication"
		"÷":
			if(!_save.DivisionComplete.empty()):
				if(_save.DivisionComplete.has(currentLevel)):
					var stars = _save.DivisionComplete.get(currentLevel)
					for star in $stars.get_children():
						if(int(star.name) <= stars):
							star.show()
				else:
					self.disabled = true
					
			if(self.name == str(0)):
				self.hide()

			currMath = "division"
		_:
			currMath = "addition"
			
	var text = currMath + " Level"
	levelTXt.text = text.capitalize()
	

	#load stars

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Level_pressed():
	SoundManager.play_se("Select")
	PlayerVariables.levelStart = int(levelNum.text)
	get_tree().change_scene("res://Scenes/MathStage.tscn")
