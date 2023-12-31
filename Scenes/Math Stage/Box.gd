extends Node2D

onready var answerBox := $Button
onready var answerLbl := $Button/Label


func _on_Button_pressed():

	Signals.emit_signal("check_answer", str2var(answerLbl.text))
	answerBox.disabled = true
	 # Replace with function body.
