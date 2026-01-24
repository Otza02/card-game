extends Node2D
class_name Player

signal playerEndTurn
var energy: int = 5
var life: int = 20
var characters: Dictionary[LanesData.LanePosition, CharacterResource] = {
	LanesData.LanePosition.UPPER: CharactersData.get_character(0),
	LanesData.LanePosition.LOWER: CharactersData.get_character(0)
}

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
	$Field.add_character(LanesData.LanePosition.UPPER, characters[LanesData.LanePosition.UPPER])
	$Field.add_character(LanesData.LanePosition.LOWER, characters[LanesData.LanePosition.LOWER])

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

func create_attacks() -> Dictionary[LanesData.LanePosition, AttackContainer]:
	return $Field.create_attacks()

func get_attacked(lane: LanesData.LanePosition, data: AttackContainer):
	$Field.get_attacked(lane, data)

func get_benefits(lane: LanesData.LanePosition, data: AttackContainer):
	$Field.get_benefits(lane, data)

func clear_field():
	$Field.clear_field()

func _on_hand_card_droped(card: Card) -> void:
	var result = detect_click(2)
	if result is LaneArea:
		result.cardDroped.emit(card)
	elif result is Area2D and result.get_parent() is PlayerHand:
		if card.get_parent() is not PlayerHand:
			var oldParent: Field = card.get_parent().get_parent()
			card.reparent($Hand)
			$Hand.update_hand()
			oldParent.update_cards()
		#if card.get_parent() is Node2D: # Creo que esto es redundante. Falta test
			#card.reparent($Hand)
			#$Hand.update_hand()

func detect_click(layer: int):
	var space_state = get_world_2d().direct_space_state
	var ray = PhysicsPointQueryParameters2D.new()
	ray.position = get_global_mouse_position()
	ray.collide_with_areas = true
	ray.collision_mask = layer
	var result = space_state.intersect_point(ray)
	if result:
		return result[0]["collider"]
