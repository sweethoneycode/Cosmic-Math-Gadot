extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var smokePart := $smoke
onready var animPlayer := $"%AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	animPlayer.play("Idle")
	Signals.connect("launch", self, "stageComplete")


func stageComplete():
	print("Finished")
	animPlayer.play("New Anim")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func next_stage():
	get_tree().change_scene("res://Scenes/LevelSelect.tscn")
