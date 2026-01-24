extends Node2D
class_name Character

var characterResource: CharacterResource

var maxArmor: int
var armor
var damage: int
var ability: String

var beforeAttack: Array[Effect] = []
var beforeTakeDamage: Array[Effect] = []
var afterTakeDamage: Array[Effect] = []
var onEndTurn: Array[Effect] = []

func init(data: CharacterResource):
	characterResource = data
	maxArmor = data.maxArmor
	armor = maxArmor
	damage = data.damage
	ability = data.ability

func _ready() -> void:
	update()

func get_attacked(card: CardResource):
	# Mejorar mas tarde
	armor -= card.damage
	update()

func get_benefits(card: CardResource):
	# Mejorar mas tarde
	update()

func update():
	$InfoDisplay/Damage.text = str(damage)
	$InfoDisplay/Armor.text = str(armor)
	$InfoDisplay/Ability.text = ability
