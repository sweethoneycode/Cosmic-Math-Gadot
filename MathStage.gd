extends Node2D

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
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


