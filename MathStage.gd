extends Node2D

var _save: SaveGame

var wrongAnswers: int = 0
onready var additionIMG := $"%Additionbckgrnd"
onready var subtrationIMG := $"%Subtractionbckgrnd"
onready var MultiplicationIMG := $"%Multiplicationbckgrnd"
onready var DivisionIMG := $"%Divisionbckgrnd"

var completedLevels : CompletedLevels = null setget set_levels
var mathType = "+"


# Called when the node enters the scene tree for the first time.
func _ready():
	mathType = PlayerVariables.stage
	pickBckgrnd()
	Signals.connect("level_complete", self, "_save")
	_save = SaveGame.load_savegame()

func set_levels(new_levels: CompletedLevels) -> void:
	completedLevels = new_levels
	
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
			
			
func _save(stagenum, stars) -> void:
		_save = SaveGame.load_savegame()
		print(stagenum, stars)
		match mathType:
			"+":
				completedLevels.add_item("addition" + str(stagenum), stars)
			"-":
				_save.subtractionLevel.insert(stagenum, stars)
			"x":
				_save.multiplcationLevel.insert(stagenum, stars)
			"÷":
				_save.multiplcationLevel.insert(stagenum, stars)
			_:
				pass 
		_save.write_savegame()
		get_tree().change_scene("res://Scenes/LevelSelect.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


