extends Node2D
class_name Character

@export_range(0, 100) var life: int
@export_range(0, 100) var damage: int
@export_range(0, 100) var armor: int
@export var ability: String

func init(data: Dictionary):
	print(data)
	life = data["Life"]
	damage = data["Damage"]
	armor = data["Armor"]
	ability = data["Ability"]

func _ready() -> void:
	$InfoDisplay/Life.text = str(life)
	$InfoDisplay/Damage.text = str(damage)
	$InfoDisplay/Armor.text = str(armor)
	$InfoDisplay/Ability.text = ability
