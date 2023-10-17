extends Node2D

var _save: SaveGame

var wrongAnswers: int = 0
var countDownInt := 10
var mathType = "+"

onready var additionIMG := $"%Additionbckgrnd"
onready var subtrationIMG := $"%Subtractionbckgrnd"
onready var MultiplicationIMG := $"%Multiplicationbckgrnd"
onready var DivisionIMG := $"%Divisionbckgrnd"

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
				subtrationIMG.show()
			"x":
				MultiplicationIMG.show()
			"÷":
				DivisionIMG.show()
			_:
				pass
			
			
func _saveProgress(stagenum) -> void:
	var stars = PlayerVariables.stageStars
	match mathType:
		"+":
			if(stars >= _save.AdditionComplete[str(stagenum)]):
				_save.AdditionComplete[str(stagenum)] = stars
			if (stagenum < 21):
				var nextstage = stagenum + 1
				_save.AdditionComplete[str(nextstage)] = 0
		"-":
			if(stars <= 3):
				_save.SubtractionComplete[str(stagenum)] = stars
			if (stagenum < 21):
				var nextstage = stagenum + 1
				_save.SubtractionComplete[str(nextstage)] = 0					
		"x":
			if(stars <= 3):
				_save.MultiComplete[str(stagenum)] = stars
			if (stagenum < 21):
				var nextstage = stagenum + 1
				_save.MultiComplete[str(nextstage)] = 0						
		"÷":
			if(stars <= 3):
				_save.DivisionComplete[str(stagenum)] = stars
			if (stagenum < 21):
				var nextstage = stagenum + 1
				_save.DivisionComplete[str(nextstage)] = 0					
		_:
			pass 
	_save.write_savegame()
	Signals.emit_signal("launch")


