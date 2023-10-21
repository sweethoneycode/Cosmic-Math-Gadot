extends Control

onready var prevBtn := $LeftBtn
onready var nextBtn := $RghtBtn
onready var Pages := [$Page1, $Page2, $Page3]
onready var levelTXT := $"%levelTXT"

var currPage = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerVariables.currScene = "LevelSelect"
	
	Pages[0].show()
	prevBtn.hide()
	

func _setLBL():
	var mathT = PlayerVariables.stage
	print(mathT)
	match mathT:
		"+":
			levelTXT.text = "Addition Level"
		"-":
			levelTXT.text = "Subtraction Level"
		"x":
			levelTXT.text = "Multiplication Level"
		"÷":
			levelTXT.text = "Division Level"
		_:
			pass
	
func _on_RghtBtn_pressed():
	if (currPage < Pages.size()):
		currPage += 1
	match currPage:
		0:
			Pages[0].show()
			Pages[1].hide()
			Pages[2].hide()
			prevBtn.hide()
			nextBtn.show()
		1:
			Pages[1].show()
			Pages[0].hide()
			Pages[2].hide()
			prevBtn.show()
			nextBtn.show()
		2:
			Pages[2].show()
			Pages[1].hide()
			Pages[0].hide()
			nextBtn.hide()


func _on_LeftBtn_pressed():
	if (currPage < Pages.size()):
		currPage -= 1
	match currPage:
		0:
			Pages[0].show()
			Pages[1].hide()
			Pages[2].hide()
			prevBtn.hide()
		1:
			Pages[1].show()
			Pages[0].hide()
			Pages[2].hide()
			prevBtn.show()
			nextBtn.show()
		2:
			Pages[2].show()
			Pages[1].hide()
			Pages[0].hide()
			nextBtn.hide()


func _on_Node2D_visibility_changed():
	_setLBL()
