extends Area2D
class_name LaneArea

func has_card() -> bool:
	for child in get_children():
		if child is Card:
			return true
	return false
func get_card():
	for child in get_children():
		if child is Card:
			return child
	assert(false, "Deberias haber llamado has_card")
