extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var wrongAnswers: int = 0
onready var symbolTxt := $"%Symbol"
onready var addend1Txt := $"%Num1"
onready var addend2Txt := $"%Num2"

var Addend2 = []
var minNum = 0
var maxNum = 0
export var Addend1num: int = 0
var Addend2num: int = 0
var mathType = "/"


# Called when the node enters the scene tree for the first time.
func _ready():
	if(mathType == "/"):
		mathType="÷"
		
	symbolTxt.text = str(mathType)
	
	addend1Txt.text = str(Addend1num)
	Addend1num = 12
	setSecondNum()

	
func createQuestions():
	pass
	
func setSecondNum():
	
	if(Addend1num < 10):
		minNum = 0
		maxNum = 10
	else:
		minNum = 0
		maxNum = 20
	
	if(mathType == "/"):
		if(Addend1num < 11):
			minNum = 0
			maxNum = 10
		else:
			minNum = 0
			maxNum = 21
	
	var number: = 0
	var random = RandomNumberGenerator.new()
	
	if(mathType != "/"):
		for i in range(10):
			random.randomize()
			
			while Addend2.has(number):
				number = random.randi_range(minNum, maxNum)
			
			Addend2.append(number)
	else:
		for i in range(10):
			random.randomize()
			
			while Addend2.has(number):
				var num = random.randi_range(1, 12)
				number = num * Addend1num
			
			Addend2.append(number)
	
	#Addend2.shuffle()
	print(Addend2)
	addend2Txt.text = str(Addend2[0])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func nextAddend():
		var index = Addend2.find(str2var(addend2Txt.text), 0) 
		if (index + 1 < Addend2.size()):
			addend2Txt.text = str(Addend2[index + 1])

func _on_Button_pressed():
	nextAddend()
