extends Node2D

onready var answerBox := $Button
onready var answerLbl := $Button/Label
onready var animPlayer := $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animPlayer.play("idle")

func _on_Button_pressed():

	Signals.emit_signal("check_answer", str2var(answerLbl.text))
	answerBox.disabled = true
	 # Replace with function body.
