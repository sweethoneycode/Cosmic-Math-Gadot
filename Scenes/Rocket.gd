extends Node2D

onready var smokePart := $smoke
onready var animPlayer := $"%AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():

	Signals.connect("launch", self, "stageComplete")


func stageComplete():
	animPlayer.play("New Anim")
	SoundManager.play_bgs("Rocket")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func next_stage():
	get_tree().change_scene("res://Scenes/Completed.tscn")
