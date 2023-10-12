extends Node2D


var currStar := 0
onready var stageStars := $StageStars
onready var starAnim := $StageStars/AnimationPlayer
var star1 : = false 
var star2 := false
var star3 := false
# Called when the node enters the scene tree for the first time.
func _ready():
	starAnim.play("not earned")
	Signals.connect("starReward", self, "starReward")


func starReward(var reward):
	reward
	
	match reward:
		1:
			if(!star1):
				starAnim.play("1 star")
				star1 = true
		2:	
			if(!star2):
				starAnim.play("2 star")
				star2 = true
		3:	
			if(!star3):
				starAnim.play("3 star")
				star3 = true
				
	PlayerVariables.stageStars = reward
