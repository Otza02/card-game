extends Node2D
class_name Player

signal playerEndTurn(attacks: Dictionary)
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
		playerEndTurn.emit($Field.end_turn())

func update_life():
	$Life.text = "Life: " + str(life)

func get_attacked(cardData: Dictionary, lane: String):
	life -= cardData["Damage"]
	update_life()

func do_attack(cardData: Dictionary, lane: String):
	print("Efecto en usuario", cardData["EffectOnUser"])

func _on_hand_card_droped(card: Card) -> void:
	var result = detect_click(2)
	if result is LaneArea:
		if not result.has_card():
			var oldParent = card.get_parent()
			card.reparent(result, true)
			card.initial_pos = result.global_position
			if oldParent is PlayerHand:
				oldParent.update_hand()
	elif result is Area2D and result.get_parent() is PlayerHand:
		if card.get_parent() is LaneArea:
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
