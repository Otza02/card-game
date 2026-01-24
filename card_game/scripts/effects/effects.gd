extends Sprite2D
class_name Effect

@export var whenToPlay: CardsData.EffectTime
@export var durationTurns: int
@export var sender: Character
@export var target: Character

func do(attack: AttackContainer):
	pass

func delete():
	pass
