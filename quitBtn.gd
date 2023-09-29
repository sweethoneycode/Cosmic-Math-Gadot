extends Button

var _save: SaveGame
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var DefaultIMG := $"%Default"
onready var MainMenu := $"%Menu"
onready var SettingsMenu := $"%SettingsMenu"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	_create_or_load_save() #load saved game
	
	MainMenu.show()

func _on_quitBtn_pressed():
	
	if (self.text != "Back"):
		get_tree().quit()
		
	if (self.text == "Back"):
		DefaultIMG.show()
		SettingsMenu.hide()
		MainMenu.show()
	
	self.text = "Exit"

func _on_Play_pressed():
	DefaultIMG.hide()
	self.text = "Back"
	get_tree().change_scene("res://Scenes/Planets.tscn")


func _on_PrivacyBtn_pressed():
# warning-ignore:return_value_discarded
	OS.shell_open("http://sweethoneycode.com/cosmic-math-app-privacy/")

func _on_SettingsBtn_pressed():
	self.text = "Back"
	MainMenu.hide()
	SettingsMenu.show()
	
func _create_or_load_save() -> void:
	if SaveGame.save_exists():
		_save = SaveGame.load_savegame()	
	else:
		_save = SaveGame.new()
		_save.AdditionComplete["0"] = 0
		_save.SubtractionComplete["0"] = 0
		_save.MultiComplete["0"] = 0
		_save.DivisionComplete["1"] = 0
		_save.write_savegame()
