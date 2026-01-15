extends Node2D

var playerAttacks: Dictionary = {}
var enemyAttacks: Dictionary = {}

func _on_player_player_end_turn(attacks: Dictionary) -> void:
	playerAttacks = attacks
	enemyAttacks = await $Enemy.end_turn()
	solve_actions("Upper")

func action_macth(playerAction: String, enemyAction: String) -> String:
	if playerAction == enemyAction:
		return "Both"
	
	elif playerAction == CardsData.Action.ATTACK and enemyAction == CardsData.Action.STRATEGY:
		return "Player"
	elif playerAction == CardsData.Action.DEFENSE and enemyAction == CardsData.Action.ATTACK:
		return "Player"
	elif playerAction == CardsData.Action.STRATEGY and enemyAction == CardsData.Action.DEFENSE:
		return "Player"
	
	elif playerAction == CardsData.Action.ATTACK and enemyAction == CardsData.Action.DEFENSE:
		return "Enemy"
	elif playerAction == CardsData.Action.DEFENSE and enemyAction == CardsData.Action.STRATEGY:
		return "Enemy"
	elif playerAction == CardsData.Action.STRATEGY and enemyAction == CardsData.Action.ATTACK:
		return "Enemy"
	
	else:
		return "None"

func solve_actions(lane: String):
	print("solved")
	match action_macth(playerAttacks[lane]["Action"], enemyAttacks[lane]["Action"]):
		"Both":
			print("Both")
		"Player":
			print("Player")
		"Enemy":
			print("Enemy")
		_:
			print("todo")
#
	#if playerAttacks[lane]["Action"] == enemyAttacks[lane]["Action"]:
		#$Player.get_attacked(enemyAttacks[lane])
		#$Player.do_attack(playerAttacks[lane])
		#
		#$Enemy.get_attacked(playerAttacks[lane])
		#$Enemy.do_attack(enemyAttacks[lane])
	
	
