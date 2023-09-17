extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var PlanetsMenu := $"../Planets"
onready var MainMenu := $"%Menu"
onready var SettingsMenu := $"%SettingsMenu"

# Called when the node enters the scene tree for the first time.
func _ready():
	MainMenu.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_quitBtn_pressed():
	
	if (self.text != "Back"):
		get_tree().quit()
		
	if (self.text == "Back"):	
			SettingsMenu.hide()
			PlanetsMenu.hide()
			MainMenu.show()
	
	self.text = "Exit"

func _on_Play_pressed():
	self.text = "Back"
	MainMenu.hide()
	PlanetsMenu.show()# Replace with function body.


func _on_PrivacyBtn_pressed():
	OS.shell_open("http://sweethoneycode.com/cosmic-math-app-privacy/")

func _on_SettingsBtn_pressed():
	self.text = "Back"
	MainMenu.hide()
	SettingsMenu.show()
