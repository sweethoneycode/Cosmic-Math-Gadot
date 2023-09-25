class_name CompletedLevels
extends Resource

# Note that dictionaries preserve their order in GDScript.
export var additionLevels := {}
export var subtractionLevels := {}
export var multiplicationLevels := {}
export var divisionLevels := {}

func additionLevel(unique_id: String, amount) -> void:
	additionLevels[unique_id] = amount

