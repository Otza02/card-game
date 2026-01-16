extends Node2D
class_name Player

signal playerEndTurn
var energy: int = 5
var life: int = 20

func _ready() -> void:
	var timer = Timer.new()
	timer.wait_time = .2
	add_child(timer)
	for i in range(5):
		timer.start()
		var card = $Deck.create_card()
		$Hand.add_card(card)
		await  timer.timeout
	timer.queue_free()
	update_life()

func _on_deck_draw_card() -> void:
	if energy > 0:
		energy -= 1
		var card = $Deck.create_card()
		$Hand.add_card(card)

func _on_end_turn_button_down() -> void:
	if $Field.can_end_turn():
		$Field.end_turn()
		playerEndTurn.emit()

func update_life():
	$Life.text = "Life: " + str(life)

func get_attacks() -> Dictionary:
	return $Field.get_attacks()

func get_attacked(lane: LanesData.LanePosition, data: Dictionary):
	$Field.get_attacked(lane, data)

func get_benefits(lane: LanesData.LanePosition, data: Dictionary):
	$Field.get_benefits(lane, data)

func _on_hand_card_droped(card: Card) -> void:
	var result = detect_click(2)
	if result is LaneArea:
		if not result.has_card():
			var oldParent = card.get_parent() # Deberia ser la Player/Hand
			card.reparent(result.cardPos, true) # Nuevo padre Field/Lane/CardPos
			card.initial_pos = result.cardPos.global_position
			if oldParent is PlayerHand:
				oldParent.update_hand()
	elif result is Area2D and result.get_parent() is PlayerHand:
		if card.get_parent() is Node2D: # Creo que esto es redundante. Falta test
			card.reparent($Hand)
			$Hand.update_hand()

func detect_click(layer: int):
	var space_state = get_world_2d().direct_space_state
	var ray = PhysicsPointQueryParameters2D.new()
	ray.position = get_global_mouse_position()
	ray.collide_with_areas = true
	ray.collision_mask = layer
	var result = space_state.intersect_point(ray)
	if result:
		return result[0]["collider"]
