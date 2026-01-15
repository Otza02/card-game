extends Node2D
class_name Enemy

@export var cardTemplate: PackedScene
var life: int = 20

func _ready() -> void:
	update_life()

func end_turn():
	var timer = Timer.new()
	timer.wait_time = 1.2
	add_child(timer)
	timer.start()
	
	var attacks: Dictionary = {}
	attacks["Upper"] = create_card()
	attacks["Lower"] = create_card()
	
	var card: Card = cardTemplate.instantiate()
	card.initial_pos = $UpperLane.global_position - Vector2(120, 0)
	card.init(attacks["Upper"])
	card.global_position = $UpperLane.global_position + Vector2(200, 0)
	card.selectable = false
	add_child(card)
	
	card = cardTemplate.instantiate()
	card.initial_pos = $LowerLane.global_position - Vector2(120, 0)
	card.init(attacks["Lower"])
	card.global_position = $LowerLane.global_position + Vector2(200, 0)
	card.selectable = false
	add_child(card)
	
	await  timer.timeout
	return attacks

func create_card():
	var index = randi_range(1, CardsData.card.size())
	return CardsData.card[index]

func update_life():
	$Life.text = "Life: " + str(life)

func get_attacked(cardData: Dictionary):
	life -= cardData["Damage"]
	update_life()

func do_attack(cardData: Dictionary):
	print(cardData["EffectOnUser"])
