extends Node2D
class_name AnswerBox


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var answers = []
var correctAnswer

var number
var random = RandomNumberGenerator.new()
onready var answerbox1 := $Box1/Button/Label
onready var answer1Anim := $Box1/AnimationPlayer


onready var answerbox2 := $Box2/Button/Label
onready var answer2Anim := $Box2/AnimationPlayer

onready var answerbox3 := $Box3/Button/Label
onready var answer3Anim := $Box3/AnimationPlayer


func _enter_tree():
	Signals.connect("get_answers", self, "_get_answers")

func _ready():
	Signals.connect("correctAns", self, "correctAnswer")
	Signals.connect("incorrect", self, "_incorrect")

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass
func _incorrect():
	if(answerbox1.text != str(correctAnswer)):
	#	answerbo1Part.emitting = true
		answer1Anim.play("explode")
		
	if(answerbox2.text != str(correctAnswer)):
		#answerbo2Part.emitting = true
		answer2Anim.play("explode")
		
	if(answerbox3.text != str(correctAnswer)):
		#answerbo3Part.emitting = true
		answer3Anim.play("explode")
		
func correctAnswer():
	if(answerbox1.text == str(correctAnswer)):
	#	answerbo1Part.emitting = true
		answer1Anim.play("correct")
		
	if(answerbox2.text == str(correctAnswer)):
		#answerbo2Part.emitting = true
		answer2Anim.play("correct")
		
	if(answerbox3.text == str(correctAnswer)):
		#answerbo3Part.emitting = true
		answer3Anim.play("correct")

func _get_answers(answer:int):
	answers.clear()

	answers.append(answer)
	
	for _i in range(2):
		number = answer
		correctAnswer = answer
		while answers.has(number):
			number = random.randi_range(2, 19)
		answers.append(number)
		answers.shuffle()		
	#print(answers, " ", answers.size())
	
	if answers.size() == 3:
		displayAnswers()


func displayAnswers():

		$Box1/Button.disabled = false
		$Box2/Button.disabled = false
		$Box3/Button.disabled = false
		
		answerbox1.text = str(answers[0])
		answerbox2.text = str(answers[1])
		answerbox3.text = str(answers[2])
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

