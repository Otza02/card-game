extends Node2D
class_name Field

func can_end_turn() -> bool:
	return $UpperArea2D.has_card() and $LowerArea2D.has_card()

func end_turn() -> Dictionary:
	if not can_end_turn():
		assert(false, "No puede terminar turno. Debrias haber llamado can_end_turn()")
	
	$UpperArea2D.get_card().selectable = false
	$LowerArea2D.get_card().selectable = false
	return {
		"Upper":$UpperArea2D.get_card().cardResource,
		"Lower":$LowerArea2D.get_card().cardResource
		}
