extends Node2D
class_name Deck

@export var cardTemplate: PackedScene
signal draw_card

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			draw_card.emit()

func create_card() -> Card:
	var cardId = randi_range(1, CardsData.card.size())
	var card: Card = cardTemplate.instantiate()
	card.initial_pos = position
	card.init(CardsData.card[cardId])
	return card
