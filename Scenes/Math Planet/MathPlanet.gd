extends Control
#var _save: SaveGame
export(String, "+", "-", "x", "/") var mathType: = "+"
var selectLabel
# Declare member variables here. Examples:
# var a = 2
# var b = "text"hipLabel.text = "0"
onready var planetLabel := $"%PlanetLabel"
onready var shipLabel := $"%ShipLabel"
export var planetImg = preload("res://images/Planets/subtraction.png")
export var planetSpeed := 1
onready var battery := $TextureButton/StageUFO/Node2D

# Called when the node enters the scene tree for the first time.
func _ready():

	$Sprite.texture = planetImg
	$Sprite.set_speed(planetSpeed)
	if(PlayerVariables.lvlsUnlocked):
		battery.hide()
#	_save = SaveGame.load_savegame()
	mathPlanet()
	
	
func mathPlanet():
	
	match mathType:
		"+":
			var levelStat = PlayerVariables.AdditionComplete.size()

			if(levelStat > 0):
				levelStat -= 1
				shipLabel.text = var2str(levelStat)
			shipLabel.text = var2str(levelStat)

		"-":
			var levelStat = PlayerVariables.SubtractionComplete.size()

			if(levelStat > 0):
				levelStat -= 1
				shipLabel.text = var2str(levelStat)
			shipLabel.text = var2str(levelStat)

		"x":
			var levelStat = PlayerVariables.MultiComplete.size()

			if(levelStat > 0):
				levelStat -= 1
				shipLabel.text = var2str(levelStat)
			shipLabel.text = var2str(levelStat)
			
		"/":
			mathType = "÷"
			var levelStat = PlayerVariables.DivisionComplete.size()

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

	BackgroundLoad.load_scene("res://Scenes/LevelSelect.tscn")

