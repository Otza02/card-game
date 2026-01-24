extends Node2D
class_name Enemy

@export var cardTemplate: PackedScene
var life: int = 20

func _ready() -> void:
	update_life()

func end_turn() -> Dictionary[LanesData.LanePosition, AttackContainer]:
	var timer = Timer.new()
	timer.wait_time = 1.2
	add_child(timer)
	timer.start()
	
	var attacks: Dictionary[LanesData.LanePosition, AttackContainer] = {}
	
	var card: Card = cardTemplate.instantiate()
	card.initial_pos = $UpperLane.global_position - Vector2(120, 0)
	card.init(create_card())
	card.global_position = $UpperLane.global_position + Vector2(200, 0)
	card.selectable = false
	add_child(card)
	var upperAtk = AttackContainer.new()
	upperAtk.load_card(card.cardResource)
	attacks[LanesData.LanePosition.UPPER] = upperAtk
	
	card = cardTemplate.instantiate()
	card.initial_pos = $LowerLane.global_position - Vector2(120, 0)
	card.init(create_card())
	card.global_position = $LowerLane.global_position + Vector2(200, 0)
	card.selectable = false
	add_child(card)
	var lowerAtk = AttackContainer.new()
	lowerAtk.load_card(card.cardResource)
	attacks[LanesData.LanePosition.LOWER] = lowerAtk
	
	await  timer.timeout
	return attacks

func create_card():
	var index = randi_range(1, CardsData.card.size())
	return CardsData.get_card(index)

func update_life():
	$Life.text = "Life: " + str(life)

func get_attacked(lane: LanesData.LanePosition, data: AttackContainer):
	pass

func get_benefits(lane: LanesData.LanePosition, data: AttackContainer):
	pass

func clear_field():
	for child in get_children():
		if child is Card:
			child.queue_free()
