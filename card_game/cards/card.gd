extends Node2D
class_name Card

var cardResource: CardResource
var selectable = true
var selected = false
var initial_pos

signal card_selected(card: Card)
signal card_droped(card: Card)


func init(cardRes: CardResource):
	cardResource = cardRes
	global_position = initial_pos
	$InfoDisplay/Action.text = str(action_name(cardResource.action))
	$InfoDisplay/Type.text = str(type_name(cardResource.type))
	$InfoDisplay/Damage.text = str(cardResource.damage)
	$InfoDisplay/EffectOnUser.text = str(cardResource.userEffect)
	$InfoDisplay/EffectOnEnemy.text = str(cardResource.enemyEffect)

func action_name(action: CardsData.Action) -> String:
	return CardsData.Action.find_key(action)

func type_name(type: CardsData.Type) -> String:
	return CardsData.Type.find_key(type)

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event["button_index"] == 1 and selectable:
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

func delete():
	queue_free()
