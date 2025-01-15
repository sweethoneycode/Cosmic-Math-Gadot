extends Control

var _save: SaveGame

onready var ConFirmDiag := $"%ConfirmationDialog"
onready var checkbtn := $"%Levels Unlocked"
# Called when the node enters the scene tree for the first time.
func _ready():

	PlayerVariables.currScene = "Settings"
	_save = SaveGame.load_savegame()

#	_create_or_load_save()
	
func _on_SettingsBtn_pressed():
	self.text = "Back"

func _on_PrivacyBtn_pressed():
# warning-ignore:return_value_discarded
	OS.shell_open("http://sweethoneycode.com/cosmic-math-app-privacy/")

#func _create_or_load_save() -> void:
#	if SaveGame.save_exists():
#		_save = SaveGame.load_savegame()	
#	else:
#		_save = SaveGame.new()
#
#		_save.AdditionComplete["0"] = 0
#		_save.SubtractionComplete["0"] = 0
#		_save.MultiComplete["0"] = 0
#		_save.DivisionComplete["1"] = 0
#		_save.write_savegame()
func _process(delta):
		checkbtn.pressed = PlayerVariables.lvlsUnlocked

func _on_ClearProgress_pressed():
	ConFirmDiag.popup_centered()
	
func _clearSave():
	_save.AdditionUnlock.clear()
	_save.SubtractionUnlock.clear()
	_save.MultiplicationUnlock.clear()
	_save.DivisionUnlock.clear()
	
	_save.AdditionComplete.clear()
	_save.SubtractionComplete.clear()
	_save.MultiComplete.clear()
	_save.DivisionComplete.clear()

func _on_ConfirmationDialog_confirmed():	

	_clearSave()
	_save.lvlsUnlocked = false
	_save.AdditionUnlock["0"] = 1
	_save.SubtractionUnlock["0"] = 1
	_save.MultiplicationUnlock["0"] = 1
	_save.DivisionUnlock = {"0":1, "1":1}
		
	_save.AdditionComplete["0"] = 0
	_save.SubtractionComplete["0"] = 0
	_save.MultiComplete["0"] = 0
	_save.DivisionComplete = {"0": 0, "1": 0}
	_save.write_savegame()

	ConFirmDiag.hide()

func _on_CheckButton_pressed():
	selectSFX()
	PlayerVariables.lvlsUnlocked = !PlayerVariables.lvlsUnlocked

	_save.lvlsUnlocked = PlayerVariables.lvlsUnlocked
	_save.write_savegame()


func selectSFX():
	SoundManager.play_se("tick")
