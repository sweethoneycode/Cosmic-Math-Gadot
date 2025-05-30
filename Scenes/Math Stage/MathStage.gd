extends Node2D

var _save: SaveGame

var wrongAnswers: int = 0
var countDownInt := 10
var mathType = "+"

onready var additionIMG := $"%Additionbckgrnd"
onready var subtrationIMG := preload("res://images/Planets/Subtraction_Planet.png")
onready var MultiplicationIMG := preload("res://images/Planets/Multiplication_planet.png")
onready var DivisionIMG := preload("res://images/Planets/Division_planet_2.png")

onready var rocketAnim := $Rocket/AnimationPlayer
onready var countdownLbl := $Countdown

# Called when the node enters the scene tree for the first time.
func _ready():

	Signals.connect("countdown", self, "countDown")
	
	PlayerVariables.currScene = "MathStage"
	mathType = PlayerVariables.stage
		
	pickBckgrnd()
	Signals.connect("level_complete", self, "_saveProgress")
	_save = SaveGame.load_savegame()
	
func countDown():
	if(countDownInt > 1):
		countDownInt -= 1
		countdownLbl.text = str(countDownInt)
	else:
		countdownLbl.hide()
		
func pickBckgrnd():
	
		match mathType:
			"+":
				additionIMG.show()
			"-":
				additionIMG.texture = subtrationIMG
			"x":
				additionIMG.texture = MultiplicationIMG
			"÷":
				additionIMG.texture = DivisionIMG
			_:
				pass
			
			
func _saveProgress(stagenum) -> void:
	var stars = PlayerVariables.stageStars
	match mathType:
		"+":
			if(stars >= 0):
				_save.AdditionComplete[str(stagenum)] = stars
				PlayerVariables.AdditionComplete[str(stagenum)] = stars
			if (stagenum < 21):
				var nextstage = stagenum + 1
				_save.AdditionUnlock[str(nextstage)] = 1
				PlayerVariables.AdditionUnlock[str(nextstage)] = 1
		"-":

			if(stars >= 0):
				_save.SubtractionComplete[str(stagenum)] = stars
				PlayerVariables.SubtractionComplete[str(stagenum)] = stars
			if (stagenum < 21):
				var nextstage = stagenum + 1
				_save.SubtractionUnlock[str(nextstage)] = 1
				PlayerVariables.SubtractionUnlock[str(nextstage)] = 1
		"x":

			if(stars >= 0):
				_save.MultiComplete[str(stagenum)] = stars
				PlayerVariables.MultiComplete[str(stagenum)] = stars
			if (stagenum < 21):
				var nextstage = stagenum + 1
				_save.MultiplicationUnlock[str(nextstage)] = 1
				PlayerVariables.MultiplicationUnlock[str(nextstage)] = 1
			
		"÷":

			if(stars >= 0):
				_save.DivisionComplete[str(stagenum)] = stars
				PlayerVariables.DivisionComplete[str(stagenum)] = stars
			if (stagenum < 21):
				var nextstage = stagenum + 1
				_save.DivisionUnlock[str(nextstage)] = 1
				PlayerVariables.DivisionUnlock[str(nextstage)] = 1
		_:
			pass 
	_save.write_savegame()
	Signals.emit_signal("launch")
