extends Effect

@export var damage: int

func do(_attackContainer: AttackContainer):
	target.take_damage()
	durationTurns -= 1
	if durationTurns <= 0:
		delete()

func delete():
	queue_free()
