extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var answerLbl := $Button/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	#print(answerLbl.text)
	Signals.emit_signal("check_answer", str2var(answerLbl.text))
	 # Replace with function body.
