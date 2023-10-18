extends Control

var _save: SaveGame

export(String, "+", "-", "x", "/") var mathType: = "+"
var selectLabel
# Declare member variables here. Examples:
# var a = 2
# var b = "text"hipLabel.text = "0"
onready var planetLabel := $"%PlanetLabel"
onready var shipLabel := $"%ShipLabel"
export var planetImg = preload("res://images/Planets/subtraction.png")
export var planetSpeed := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	_save = SaveGame.load_savegame()
	$Sprite.texture = planetImg
	$Sprite.set_speed(planetSpeed)
	mathPlanet()
	

func mathPlanet():
	
	match mathType:
		"+":
			if(!_save.AdditionComplete.empty()):
				var levelStat = _save.AdditionComplete.size()
				if(levelStat > 0):
					levelStat -= 1
					shipLabel.text = var2str(levelStat)

		"-":
			if(!_save.SubtractionComplete.empty()):
				var levelStat = _save.SubtractionComplete.size()
				if(levelStat > 0):
					levelStat -= 1
					shipLabel.text = var2str(levelStat)

		"x":
			if(!_save.MultiComplete.empty()):
				var levelStat = _save.MultiComplete.size()
				if(levelStat > 0):
					levelStat -= 1
					shipLabel.text = var2str(levelStat)
			
		"/":
			mathType = "÷"
			if(!_save.DivisionComplete.empty()):
				var levelStat = _save.DivisionComplete.size()
				if(levelStat > 1):
					levelStat -= 1
					shipLabel.text = var2str(levelStat)
				shipLabel.text = "1"

		_:
			pass

	planetLabel.text = mathType

func _on_TextureButton_pressed():
	SoundManager.play_se("Select")
	PlayerVariables.stage = mathType
	
	get_tree().change_scene("res://Scenes/LevelSelect.tscn")

