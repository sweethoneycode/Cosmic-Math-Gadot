extends Node2D
class_name AnswerBox

var answers = []
var corrAnswer

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
	disBtn()
	SoundManager.play_se("Incorrect")
	if(answerbox1.text != str(corrAnswer)):
	#	answerbo1Part.emitting = true
		answer1Anim.play("explode")
		
	if(answerbox2.text != str(corrAnswer)):
		#answerbo2Part.emitting = true
		answer2Anim.play("explode")
		
	if(answerbox3.text != str(corrAnswer)):
		#answerbo3Part.emitting = true
		answer3Anim.play("explode")
		
func correctAnswer(answer:int):
	disBtn()
	_incorrect()
	
	correctSFX()
	
	if(answerbox1.text == str(answer)):
	#	answerbo1Part.emitting = true
		answer1Anim.play("correct")
		
	if(answerbox2.text == str(answer)):
		#answerbo2Part.emitting = true
		answer2Anim.play("correct")
		
	if(answerbox3.text == str(answer)):
		#answerbo3Part.emitting = true
		answer3Anim.play("correct")

func correctSFX():
	SoundManager.play_se("Correct")

func _get_answers(answer:int):
	
	answers.clear()
	disBtn()
	
	answers.append(answer)
	
	for _i in range(2):
		number = answer
		corrAnswer = answer
		while answers.has(number):
			number = random.randi_range(2, 19)
		answers.append(number)
		answers.shuffle()		
	#print(answers, " ", answers.size())
	
	if answers.size() == 3:
		displayAnswers()

func newBTN():
	$Box1/AnimationPlayer.play("new box")
	$Box2/AnimationPlayer.play("new box")
	$Box3/AnimationPlayer.play("new box")
	
func disBtn():
		$Box1/Button.disabled = true
		$Box2/Button.disabled = true
		$Box3/Button.disabled = true
		
func displayAnswers():
		
		newBTN()
		
		answerbox1.text = str(answers[0])
		answerbox2.text = str(answers[1])
		answerbox3.text = str(answers[2])
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

