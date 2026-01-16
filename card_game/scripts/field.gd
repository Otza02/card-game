extends Node2D
class_name Field

@export var charTemplate: PackedScene

func _ready() -> void:
	var idx = randi_range(0, CharactersData.characters.size() - 1)
	var upperChar: Character = charTemplate.instantiate()
	upperChar.init(CharactersData.characters[idx])
	
	var lowerChar: Character = charTemplate.instantiate()
	lowerChar.init(CharactersData.characters[idx])
	
	$UpperArea2D/CharacterPos.add_child(upperChar)
	$LowerArea2D/CharacterPos.add_child(lowerChar)

func can_end_turn() -> bool:
	return $UpperArea2D.has_card() and $LowerArea2D.has_card()

func end_turn():
	if not can_end_turn():
		assert(false, "No puede terminar turno. Debrias haber llamado can_end_turn()")
	
	$UpperArea2D.get_card().selectable = false
	$LowerArea2D.get_card().selectable = false

func get_attacks() -> Dictionary:
	"Falta mejorar esto y hacer que devuelva un buen objeto de ataque"
	var attacks = {
		LanesData.LanePosition.UPPER: $UpperArea2D.get_card().cardResource,
		LanesData.LanePosition.LOWER: $LowerArea2D.get_card().cardResource
	}
	return attacks

func get_benefits(lane: LanesData.LanePosition, card: Dictionary):
	if lane == LanesData.LanePosition.UPPER:
		print("Upper")
	elif lane == LanesData.LanePosition.LOWER:
		print("Lower")
	else:
		print("Error ", lane)

func get_attacked(lane: LanesData.LanePosition, card: Dictionary):
	if lane == LanesData.LanePosition.UPPER:
		print("Upper")
	elif lane == LanesData.LanePosition.LOWER:
		print("Lower")
	else:
		print("Error ", lane)
