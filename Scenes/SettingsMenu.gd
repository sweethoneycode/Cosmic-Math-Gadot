extends Control

var _save: SaveGame

onready var ConFirmDiag := $ConfirmationDialog
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _on_SettingsBtn_pressed():
	self.text = "Back"

func _on_PrivacyBtn_pressed():
# warning-ignore:return_value_discarded
	OS.shell_open("http://sweethoneycode.com/cosmic-math-app-privacy/")
	
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

func _on_ClearProgress_pressed():
	ConFirmDiag.popup_centered()

func _on_ConfirmationDialog_confirmed():
	
	_save.AdditionComplete.clear()
	_save.SubtractionComplete.clear()
	_save.MultiComplete.clear()
	_save.DivisionComplete.clear()
	
	_save.AdditionComplete["0"] = 0
	_save.SubtractionComplete["0"] = 0
	_save.MultiComplete["0"] = 0
	_save.DivisionComplete["1"] = 0
	_save.write_savegame()


	ConFirmDiag.hide()
