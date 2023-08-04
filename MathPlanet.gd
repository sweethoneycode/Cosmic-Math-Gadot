extends Control
export(String, "+", "-", "x", "/") var mathType: = "+"
var selectLabel
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var planetLabel := $PlanetLabel
onready var shipLabel := $"%ShipLabel"
export var planetImg = preload("res://images/Planets/subtraction.png")
var scene = preload("res://MathStage.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureRect.texture = planetImg
	mathPlanet()
	

func mathPlanet():
	
	match mathType:
		"+":
			print("+")
		"-":
			print("-")
		"x":
			print("x")
		"/":
			mathType = "÷"
		_:
			pass
	shipLabel.text = "0"
	planetLabel.text = mathType
# what planet was selected and use that to choose what math type to use 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	PlayerVariables.stage = mathType
	print(PlayerVariables.stage)
	get_tree().change_scene("res://MathStage.tscn")

