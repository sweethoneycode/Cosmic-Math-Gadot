extends Node2D

onready var symbolTxt := $"%Symbol"
onready var addend1Txt := $"%Num1"
onready var addend2Txt := $"%Num2"
onready var answerTxt := $"%AnswerNum"

var Addend2 = []
var answer = 0

var minNum = 0
var maxNum = 0

export var Addend1num: int = 0
var Addend2num: int = 0
export var mathType = "+"
var number: = 0
var random = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	
	mathType = PlayerVariables.stage
	Addend1num = 1
	
	if(mathType == "/"):
		mathType="÷"
		setDivideNum()
	else:
		setSecondNum()
		

	symbolTxt.text = str(mathType)
	#addend1Txt.text = str(Addend1num)
	
	Signals.connect("check_answer", self, "_check_answer")
	Signals.connect("set_answer", self, "set_Answer")
# warning-ignore:return_value_discarded
	#Signals.connect("next_question", self, "nextAddend")
	


func setDivideNum():
	print("Divide")
	if(Addend1num < 11):
		minNum = 1
		maxNum = 1
	else:
		minNum = 0
		maxNum = 21
	
	randomize()
	for _i in range(10):
		#random.randomize()
		number = Addend1num
		while Addend2.has(number):
			var num = random.randi_range(1, 12)
			number = num + Addend1num
		Addend2.append(number)
	
	Addend2.shuffle()
	Addend2num = Addend2[0]
	
	set_Question()
	get_answer(Addend2num)
	
func setSecondNum():
	
	if(Addend1num < 10):
		minNum = 0
		maxNum = 10
	else:
		minNum = 0
		maxNum = 20
	randomize()
	for _i in range(10):
		number = Addend1num
		while Addend2.has(number):
			number = random.randi_range(minNum, maxNum)
		Addend2.append(number)
	
		
	Addend2.shuffle()
	#print(Addend2)
	#addend2Txt.text = str(Addend2[0])
	Addend2num = Addend2[0]
	set_Question()
	get_answer(Addend2num)

func get_answer(addend2:int):
	
	match mathType:
		"+":
			answer = addend2 + Addend1num
		"-":
			if(Addend1num > addend2):
				answer = Addend1num - addend2
			else:
				answer = addend2 - Addend1num
		"x":
			answer = addend2 * Addend1num
		"÷":
			if(Addend1num > addend2):
				answer = float(Addend1num) / addend2
			else:
				answer = float(addend2) / Addend1num
		_:
			pass
	set_Answer(answer)

func set_Question():
	
	if(mathType =="÷" or mathType =="-"):
		if(Addend1num > Addend2num):
			addend1Txt.text = str(Addend1num)
			addend2Txt.text = str(Addend2num)
		else:
			addend1Txt.text = str(Addend2num)
			addend2Txt.text = str(Addend1num)
	else:
		addend1Txt.text = str(Addend1num)
		addend2Txt.text = str(Addend2num)
		
func set_Answer(answer:int):

	answerTxt.text = str(answer)
	Signals.emit_signal("get_answers", answer)
	
func _check_answer(check_answer:int):
	if(check_answer == answer):
		print("Correct!")
	else:
		print("Incorrect!")
	nextAddend()

func nextAddend():
		var index = Addend2.find(Addend2num, 0) 
		if (index + 1 < Addend2.size()):
			#addend2Txt.text = str(Addend2[index + 1])
			Addend2num = Addend2[index +1]
			set_Question()
			get_answer(Addend2num)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
