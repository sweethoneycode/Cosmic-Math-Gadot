extends Node2D

var _save: SaveGame

var wrongAnswers: int = 0
onready var additionIMG := $"%Additionbckgrnd"
onready var subtrationIMG := $"%Subtractionbckgrnd"
onready var MultiplicationIMG := $"%Multiplicationbckgrnd"
onready var DivisionIMG := $"%Divisionbckgrnd"

var mathType = "+"

# Called when the node enters the scene tree for the first time.
func _ready():
	mathType = PlayerVariables.stage
	pickBckgrnd()
	Signals.connect("level_complete", self, "_saveProgress")
	_save = SaveGame.load_savegame()

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
			
			
func _saveProgress(stagenum, stars) -> void:
		match mathType:
			"+":
				_save.AdditionComplete[str(stagenum)] = stars
				if (stagenum < 21):
					var nextstage = stagenum + 1
					_save.AdditionComplete[str(nextstage)] = 0
			"-":
				_save.SubtractionComplete[str(stagenum)] = stars
			"x":
				_save.MultiComplete[str(stagenum)] = stars
			"÷":
				_save.DivisionComplete[str(stagenum)] = stars
			_:
				pass 
		_save.write_savegame()
		get_tree().change_scene("res://Scenes/LevelSelect.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


