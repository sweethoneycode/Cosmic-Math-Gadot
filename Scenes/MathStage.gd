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
				if(stars <= 3):
					_save.AdditionComplete[str(stagenum)] = stars
				if (stagenum < 20):
					var nextstage = stagenum + 1
					_save.AdditionComplete[str(nextstage)] = 0
			"-":
				if(stars <= 3):
					_save.SubtractionComplete[str(stagenum)] = stars
				if (stagenum < 20):
					var nextstage = stagenum + 1
					_save.SubtractionComplete[str(nextstage)] = 0					
			"x":
				if(stars <= 3):
					_save.MultiComplete[str(stagenum)] = stars
				if (stagenum < 20):
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
		#get_tree().change_scene("res://Scenes/LevelSelect.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


