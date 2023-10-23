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
				_save.AdditionUnlock[str(nextstage)] = 1

		"-":
			if(stars >= _save.SubtractionComplete[str(stagenum)]):
				_save.SubtractionComplete[str(stagenum)] = stars

			if (stagenum < 21):
				var nextstage = stagenum + 1
				_save.SubtractionUnlock[str(nextstage)] = 1

		"x":
			if(stars >= _save.MultiComplete[str(stagenum)]):
				_save.MultiComplete[str(stagenum)] = stars

			if (stagenum < 21):
				var nextstage = stagenum + 1
				_save.MultiplicationUnlock[str(nextstage)] = 1
			
		"÷":
			if(stars <= _save.DivisionComplete[str(stagenum)]):
				_save.DivisionComplete[str(stagenum)] = stars

			if (stagenum < 21):
				var nextstage = stagenum + 1
				_save.DivisionUnlock[str(nextstage)] = 1
			
		_:
			pass 
	_save.write_savegame()
	Signals.emit_signal("launch")
