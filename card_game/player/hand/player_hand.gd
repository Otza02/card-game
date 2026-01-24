extends Node2D
class_name PlayerHand

signal cardDroped(card: Card)

var cards: Array[Card] = []
var window_size: Vector2

var selected_card: Card = null

func _ready() -> void:
	window_size = get_window().size
	update_hand()

func detect_click(layer: int):
	var space_state = get_world_2d().direct_space_state
	var ray = PhysicsPointQueryParameters2D.new()
	ray.position = get_global_mouse_position()
	ray.collide_with_areas = true
	ray.collision_mask = layer
	var result = space_state.intersect_point(ray)
	if result:
		return result[0]["collider"]

func on_card_selected(card: Card):
	selected_card = card

func on_card_droped(card: Card):
	cardDroped.emit(card)

func delete_card():
	cards.erase(selected_card)
	remove_child(selected_card)
	#selected_card.queue_free()
	update_hand()

func add_card(card: Card):
	add_child(card)
	update_hand()

func update_hand():
	cards = []
	for child in get_children():
		if not child.is_queued_for_deletion() and child is Card:
			cards.append(child)
			if not child.card_selected.is_connected(on_card_selected):
				child.card_selected.connect(on_card_selected)
			if not child.card_droped.is_connected(on_card_droped):
				child.card_droped.connect(on_card_droped)

func _process(_delta: float) -> void:
	for i in range(cards.size()):
		cards[i].initial_pos = Vector2(
			(window_size.x / (cards.size()+1)) + (window_size.x / (cards.size()+1)) * i,
			window_size.y * 5/6
			)
