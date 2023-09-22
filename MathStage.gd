extends Node2D

var wrongAnswers: int = 0
onready var additionIMG := $"%Additionbckgrnd"
onready var subtrationIMG := $"%Subtractionbckgrnd"
onready var MultiplicationIMG := $"%Multiplicationbckgrnd"

var mathType = "+"

# Called when the node enters the scene tree for the first time.
func _ready():
	mathType = PlayerVariables.stage
	pickBckgrnd()
	
func pickBckgrnd():
		match mathType:
			"+":
				additionIMG.show()
			"-":
				subtrationIMG.show()
			"x":
				MultiplicationIMG.show()
			"/":
				pass
			_:
				pass
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_BackBtn_pressed():
	get_tree().change_scene("res://main.tscn")
