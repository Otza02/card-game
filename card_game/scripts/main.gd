extends Node2D

@onready var player: Player = $Player
@onready var enemy: Enemy = $Enemy

var playerAttacks: Dictionary = {}
var enemyAttacks: Dictionary = {}

func _on_player_player_end_turn() -> void:
	playerAttacks = $Player.get_attacks()
	enemyAttacks = await $Enemy.end_turn()
	solve_actions(LanesData.LanePosition.UPPER)
	solve_actions(LanesData.LanePosition.LOWER)

func action_macth(playerAction: CardsData.Action, enemyAction: CardsData.Action) -> String:
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

func solve_actions(lane: LanesData.LanePosition):
	match action_macth(playerAttacks[lane]["Action"], enemyAttacks[lane]["Action"]):
		"Both":
			player.get_benefits(lane, playerAttacks[lane])
			player.get_attacked(lane, enemyAttacks[lane])
			
			enemy.get_benefits(lane, enemyAttacks[lane])
			enemy.get_attacked(lane, playerAttacks[lane])
		"Player":
			player.get_benefits(lane, playerAttacks[lane])
			enemy.get_attacked(lane, playerAttacks[lane])
		"Enemy":
			player.get_attacked(lane, enemyAttacks[lane])
			enemy.get_benefits(lane, enemyAttacks[lane])
		_:
			print("Error En main.solve_actions()")
