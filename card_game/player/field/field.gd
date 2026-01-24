extends Node2D
class_name Field

@export var charTemplate: PackedScene
@export var upperLane: LaneArea
@export var lowerLane: LaneArea
var upperCard: Card = null
var lowerCard: Card = null
var upperCharacter: Character = null
var lowerCharacter: Character = null


func add_character(lane: LanesData.LanePosition, character: CharacterResource):
	if lane == LanesData.LanePosition.UPPER:
		upperCharacter = charTemplate.instantiate()
		upperCharacter.init(character)
		$UpperCharacterPos.add_child(upperCharacter)
	elif lane == LanesData.LanePosition.LOWER:
		lowerCharacter = charTemplate.instantiate()
		lowerCharacter.init(character)
		$LowerCharacterPos.add_child(lowerCharacter)

func can_end_turn() -> bool:
	return upperCard and lowerCard

func end_turn():
	if not can_end_turn():
		assert(false, "No puede terminar turno. Debrias haber llamado can_end_turn()")
	
	($UpperCardPos.get_child(0) as Card).selectable = false
	($LowerCardPos.get_child(0) as Card).selectable = false

func create_attacks() -> Dictionary[LanesData.LanePosition, AttackContainer]:
	var attacks: Dictionary[LanesData.LanePosition, AttackContainer] = {}
	# Todo esto es para el upperLane
	var upperAtk = AttackContainer.new()
	upperAtk.load_card(upperCard.cardResource)
	upperAtk.sender = upperCharacter
	if upperAtk.action != CardsData.Action.STRATEGY:
		upperAtk.damage += upperCharacter.damage
	
	for eff in upperCharacter.beforeAttack:
		eff.do(upperAtk)
	attacks[LanesData.LanePosition.UPPER] = upperAtk
	
	# Todo esto es para el lowerLane
	var lowerAtk = AttackContainer.new()
	lowerAtk.load_card(lowerCard.cardResource)
	lowerAtk.sender = lowerCharacter
	if lowerAtk.action != CardsData.Action.STRATEGY:
		lowerAtk.damage += lowerCharacter.damage
	
	for eff in lowerCharacter.beforeAttack:
		eff.do(lowerAtk)
	attacks[LanesData.LanePosition.LOWER] = lowerAtk
	
	return attacks

func get_benefits(lane: LanesData.LanePosition, card: AttackContainer):
	if lane == LanesData.LanePosition.UPPER:
		pass
	elif lane == LanesData.LanePosition.LOWER:
		pass
	else:
		print("Error ", lane)

func get_attacked(lane: LanesData.LanePosition, card: AttackContainer):
	if lane == LanesData.LanePosition.UPPER:
		pass
	elif lane == LanesData.LanePosition.LOWER:
		pass
	else:
		print("Error ", lane)

func clear_field():
	$UpperCardPos.get_child(0).queue_free()
	$LowerCardPos.get_child(0).queue_free()
	update_cards()

func update_cards():
	if $UpperCardPos.get_child_count() == 1:
		upperCard = $UpperCardPos.get_child(0)
	else:
		upperCard = null
	if $LowerCardPos.get_child_count() == 1:
		lowerCard = $LowerCardPos.get_child(0)
	else:
		lowerCard = null

func _on_upper_lane_card_droped(card: Card) -> void:
	if not upperCard:
		var oldParent = card.get_parent()
		card.reparent($UpperCardPos)
		card.initial_pos = $UpperCardPos.global_position
		if oldParent is PlayerHand:
			oldParent.update_hand()
		update_cards()


func _on_lower_lane_card_droped(card: Card) -> void:
	if not lowerCard:
		var oldParent = card.get_parent()
		card.reparent($LowerCardPos)
		card.initial_pos = $LowerCardPos.global_position
		if oldParent is PlayerHand:
			oldParent.update_hand()
		update_cards()
