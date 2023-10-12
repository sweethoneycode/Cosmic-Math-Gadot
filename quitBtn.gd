extends Button

var _save: SaveGame

onready var DefaultIMG := $"%bkgrnd"
onready var SettingsMenu := $"../SettingsBtn"
# Called when the node enters the scene tree for the first time.
func _ready():
	
	AudioPlayer.changeMusic("track1")
	PlayerVariables.stageStars =0
	_create_or_load_save() #load saved game

func selectSFX():
	SoundManager.play_se("Select")

func _on_quitBtn_pressed():
	selectSFX()
	get_tree().quit()

func _on_Play_pressed():
	selectSFX()
	get_tree().change_scene("res://Scenes/Planets.tscn")


func _on_PrivacyBtn_pressed():
	selectSFX()
# warning-ignore:return_value_discarded
	OS.shell_open("http://sweethoneycode.com/cosmic-math-app-privacy/")

func _on_SettingsBtn_pressed():
	selectSFX()
	get_tree().change_scene("res://Scenes/SettingsMenu.tscn")	
	
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
