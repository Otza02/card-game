extends Area2D
class_name LaneArea

@export var lane: LanesData.LanePosition
@onready var cardPos: Node2D = $CardPos

func has_card() -> bool:
	for child in cardPos.get_children():
		if child is Card:
			return true
	return false

func get_card():
	for child in cardPos.get_children():
		if child is Card:
			return child
	assert(false, "Deberias haber llamado has_card")

func get_attacked(data: Dictionary):
	pass
