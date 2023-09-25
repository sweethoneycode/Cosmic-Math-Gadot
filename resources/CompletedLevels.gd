class_name CompletedLevels
extends Resource

# Note that dictionaries preserve their order in GDScript.
export var items := {}


func add_item(unique_id: String, stars) -> void:
	if unique_id in items:
		items[unique_id] += stars
	else:
		items[unique_id] = stars
	emit_changed()


func get_amount(item_unique_id: String) -> int:
	if not item_unique_id in items:
		printerr("Trying to get the amount of item %s but the inventory doesn't have it." % item_unique_id)
		return -1
	
	return items[item_unique_id]


func remove_item(item_unique_id: String, amount := 1) -> void:
	if not item_unique_id in items:
		printerr("Trying to remove item %s but the inventory doesn't have it." % item_unique_id)
		return

	items[item_unique_id] -= amount
	if items[item_unique_id] <= 0:
		items.erase(item_unique_id)
	emit_changed()
