extends Resource
class_name AttackContainer

var sender: Character
var action: CardsData.Action
var attackCount: int
var damage: int
var UserEffects: Array
var EnemyEffects: Array

func load_card(card: CardResource):
	action = card.action
	if card.action == CardsData.Action.STRATEGY:
		attackCount = 0
		damage = 0
	else:
		attackCount = 1
		damage = card.damage
	UserEffects = card.userEffect
	EnemyEffects = card.enemyEffect

func load_character(character: CharacterResource):
	pass
