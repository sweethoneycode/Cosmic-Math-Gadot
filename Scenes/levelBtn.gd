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
	_create_or_load_save() #load saved game
	checkStage()

func _create_or_load_save() -> void:
	if SaveGame.save_exists():
		_save = SaveGame.load_savegame()
		
func checkStage():
	mathType = PlayerVariables.stage
	
	currentLevel == int(self.name)
	levelNum.text = self.name
	
	match mathType:
		"+":
			print (_save.levels)
			currMath = "addition"
		"-":
			print (_save.levels)
			currMath = "subtraction"
		"x":
			print (_save.levels)
			currMath = "multiplication"
		"÷":
			if(self.name == str(0)):
				self.disabled = true
			print (_save.divisionLevel)
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
	PlayerVariables.levelStart = int(self.name)
	get_tree().change_scene("res://MathStage.tscn")
