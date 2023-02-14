extends Node2D
class_name AnswerBox


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var answers = []

var number
var random = RandomNumberGenerator.new()
onready var answerbox1 := $Box1/Button/Label
onready var answerbox2 := $Box2/Button/Label
onready var answerbox3 := $Box3/Button/Label

func _enter_tree():
	Signals.connect("get_answers", self, "_get_answers")

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass

func _get_answers(answer:int):
	answers.clear()

	answers.append(answer)
	
	for _i in range(2):
		number = answer
		while answers.has(number):
			number = random.randi_range(2, 19)
		answers.append(number)
		answers.shuffle()		
	#print(answers, " ", answers.size())
	
	if answers.size() == 3:
		displayAnswers()


func displayAnswers():

		answerbox1.text = str(answers[0])
		answerbox2.text = str(answers[1])
		answerbox3.text = str(answers[2])
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

