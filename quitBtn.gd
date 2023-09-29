extends Button

var _save: SaveGame
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var DefaultIMG := $"%Default"
onready var PlanetsMenu := $"../Planets"
onready var MainMenu := $"%Menu"
onready var SettingsMenu := $"%SettingsMenu"
onready var ConFirmDiag := $"../ConfirmationDialog"

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
		PlanetsMenu.hide()
		MainMenu.show()
	
	self.text = "Exit"

func _on_Play_pressed():
	DefaultIMG.hide()
	self.text = "Back"
	MainMenu.hide()
	PlanetsMenu.show()# Replace with function body.


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
		
			
		if(_save.AdditionComplete.empty()):
			_save.AdditionComplete["0"] = 0
			_save.write_savegame()							
		if(_save.SubtractionComplete.empty()):
			_save.SubtractionComplete["0"] = 0
			_save.write_savegame()		
		if(_save.MultiComplete.empty()):
			_save.MultiComplete["0"] = 0
			_save.write_savegame()		
		if(_save.DivisionComplete.empty()):
			_save.DivisionComplete["1"] = 0
			_save.write_savegame()	
		
	else:
		_save = SaveGame.new()
		_save.AdditionComplete["0"] = 0
		_save.SubtractionComplete["0"] = 0
		_save.MultiComplete["0"] = 0
		_save.DivisionComplete["1"] = 0
		_save.write_savegame()


func _on_ClearProgress_pressed():

	ConFirmDiag.popup_centered()


func _on_ConfirmationDialog_confirmed():
	_save.AdditionComplete.clear()
	_save.SubtractionComplete.clear()
	_save.MultiComplete.clear()
	_save.DivisionComplete.clear()
	_save.write_savegame()
