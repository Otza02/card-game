extends Node2D
class_name Card

var cardResource: Dictionary
var selectable = true
var selected = false
var initial_pos

signal card_selected(card: Card)
signal card_droped(card: Card)

func init(cardRes: Dictionary):
	cardResource = cardRes
	position = initial_pos
	$InfoDisplay/Action.text = cardResource["Action"]
	$InfoDisplay/Type.text = cardResource["Type"]
	$InfoDisplay/Damage.text = str(cardResource["Damage"])
	$InfoDisplay/EffectOnUser.text = cardResource["EffectOnUser"]
	$InfoDisplay/EffectOnEnemy.text = cardResource["EffectOnEnemy"]

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and selectable:
		if event.pressed:
			selected = true
			card_selected.emit(self)
			position = to_global(position)
		else:
			selected = false
			card_droped.emit(self)

func _process(_delta: float) -> void:
	if selected:
		global_position = get_global_mouse_position()
	else:
		global_position = lerp(global_position, initial_pos, 0.05)
