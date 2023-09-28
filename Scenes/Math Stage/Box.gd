extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var answerBox := $Button
onready var answerLbl := $Button/Label
onready var correctBolts := $"%CorrectBolts"
onready var animPlayer := $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animPlayer.play("idle")
	#Signals.connect("correctAns", self, "_correctAnswer")
	#Signals.connect("incomplete",self, "_incorrect")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _incorrect():
	self.animPlayer.play("explode")
	
func _correctAnswer():
	self.animPlayer.play("correct")

func _on_Button_pressed():

	Signals.emit_signal("check_answer", str2var(answerLbl.text))
	answerBox.disabled = true
	 # Replace with function body.
