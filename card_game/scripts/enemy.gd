extends Node2D
class_name Enemy

@export var cardTemplate: PackedScene
var life: int = 20

func _ready() -> void:
	update_life()

func end_turn() -> Dictionary:
	var timer = Timer.new()
	timer.wait_time = 1.2
	add_child(timer)
	timer.start()
	
	var attacks: Dictionary = {}
	
	var card: Card = cardTemplate.instantiate()
	card.initial_pos = $UpperLane.global_position - Vector2(120, 0)
	card.init(create_card())
	card.global_position = $UpperLane.global_position + Vector2(200, 0)
	card.selectable = false
	add_child(card)
	attacks[LanesData.LanePosition.UPPER] = card.cardResource
	
	card = cardTemplate.instantiate()
	card.initial_pos = $LowerLane.global_position - Vector2(120, 0)
	card.init(create_card())
	card.global_position = $LowerLane.global_position + Vector2(200, 0)
	card.selectable = false
	add_child(card)
	attacks[LanesData.LanePosition.LOWER] = card.cardResource
	
	await  timer.timeout
	return attacks

func create_card():
	var index = randi_range(1, CardsData.card.size())
	return CardsData.card[index]

func update_life():
	$Life.text = "Life: " + str(life)

func get_attacked(lane: LanesData.LanePosition, data: Dictionary):
	pass

func get_benefits(lane: LanesData.LanePosition, data: Dictionary):
	pass
