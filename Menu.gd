extends Control

var _save: SaveGame
onready var settingsMenu := $"../SettingsMenu"
onready var mainMenu := $"%Menu"

var stats: StageStats setget set_stats
# Called when the node enters the scene tree for the first time.
func _ready():
	
	settingsMenu.hide()
	mainMenu.show()
	
	SoundManager.play_bgm("Stage")

	_create_or_load_save() #load saved game


func set_stats(new_stats: StageStats) -> void:
	stats = new_stats
	
func selectSFX():
	SoundManager.play_se("Select")

func _on_quitBtn_pressed():
	selectSFX()
	get_tree().quit()

func _on_Play_pressed():
	selectSFX()
	BackgroundLoad.load_scene("res://Scenes/Planets.tscn")

func _on_PrivacyBtn_pressed():
	selectSFX()
# warning-ignore:return_value_discarded
	OS.shell_open("http://sweethoneycode.com/cosmic-math-app-privacy/")

func _on_SettingsBtn_pressed():
	selectSFX()
	settingsMenu.show()
	mainMenu.hide()
	
func _create_or_load_save() -> void:
	if SaveGame.save_exists():
		_save = SaveGame.load_savegame()
		
		stats = _save.playerStats
		
		PlayerVariables.AdditionUnlock = _save.AdditionUnlock
		PlayerVariables.SubtractionUnlock = _save.SubtractionUnlock
		PlayerVariables.MultiplicationUnlock = _save.MultiplicationUnlock
		PlayerVariables.DivisionUnlock = _save.DivisionUnlock	
		PlayerVariables.AdditionComplete = _save.AdditionComplete
		PlayerVariables.SubtractionComplete = _save.SubtractionComplete
		PlayerVariables.MultiComplete = _save.MultiComplete
		PlayerVariables.DivisionComplete = _save.DivisionComplete
		
	else:
		_save = SaveGame.new()
		
#		_save.playerStats = Playerstats.new()
		

#		_save.AdditionUnlock = {"0": 1}
#		_save.SubtractionUnlock = {"0": 1}
#		_save.MultiplicationUnlock = {"0": 1}
#		_save.DivisionUnlock = {"0": 0, "1": 0}
#
#		_save.AdditionComplete = {"0": 0}
#		_save.SubtractionComplete = {"0": 0}
#		_save.MultiComplete = {"0": 0}
#		_save.DivisionComplete = {"0": 0, "1": 0}

		PlayerVariables.AdditionUnlock = {"0": 1}
		PlayerVariables.SubtractionUnlock = {"0": 1}
		PlayerVariables.MultiplicationUnlock = {"0": 1}
		PlayerVariables.DivisionUnlock = {"0": 0, "1": 0}	
		PlayerVariables.AdditionComplete = {"0": 0}
		PlayerVariables.SubtractionComplete = {"0": 0}
		PlayerVariables.MultiComplete = {"0": 0}
		PlayerVariables.DivisionComplete = {"0": 0, "1": 0}
		_save.write_savegame()
	

