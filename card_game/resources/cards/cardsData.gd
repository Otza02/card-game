extends Node


enum Action {ATTACK, DEFENSE, STRATEGY}
enum Type {ANY, FIRE, ICE, WATER}
enum EffectTime {
	BEFORE_ATTACK,
	BEFORE_TAKE_DAMAGE,
	AFTER_TAKE_DAMAGE,
	ON_END_TURN,
	ON_START_TURN
}

const card: Dictionary[int, Dictionary] = {
	1:{"Action":Action.ATTACK, "Type":Type.FIRE, "Damage":3, "UserEffect":[], "enemyEffect":[]},
	2:{"Action":Action.ATTACK, "Type":Type.FIRE, "Damage":4, "UserEffect":[], "enemyEffect":[]},
	3:{"Action":Action.ATTACK, "Type":Type.FIRE, "Damage":2, "UserEffect":[], "enemyEffect":[]},
	4:{"Action":Action.ATTACK, "Type":Type.FIRE, "Damage":1, "UserEffect":[], "enemyEffect":[]},
	5:{"Action":Action.ATTACK, "Type":Type.FIRE, "Damage":1, "UserEffect":[], "enemyEffect":[]},
	
	6:{"Action":Action.DEFENSE, "Type":Type.FIRE, "Damage":1, "UserEffect":[], "enemyEffect":[]},
	7:{"Action":Action.DEFENSE, "Type":Type.FIRE, "Damage":1, "UserEffect":[], "enemyEffect":[]},
	8:{"Action":Action.DEFENSE, "Type":Type.FIRE, "Damage":1, "UserEffect":[], "enemyEffect":[]},
	9:{"Action":Action.DEFENSE, "Type":Type.FIRE, "Damage":1, "UserEffect":[], "enemyEffect":[]},
	10:{"Action":Action.DEFENSE, "Type":Type.FIRE, "Damage":1, "UserEffect":[], "enemyEffect":[]},
	
	11:{"Action":Action.STRATEGY, "Type":Type.FIRE, "Damage":0, "UserEffect":[], "enemyEffect":[]},
	12:{"Action":Action.STRATEGY, "Type":Type.FIRE, "Damage":0, "UserEffect":[], "enemyEffect":[]},
	13:{"Action":Action.STRATEGY, "Type":Type.FIRE, "Damage":0, "UserEffect":[], "enemyEffect":[]},
	14:{"Action":Action.STRATEGY, "Type":Type.FIRE, "Damage":0, "UserEffect":[], "enemyEffect":[]},
	15:{"Action":Action.STRATEGY, "Type":Type.FIRE, "Damage":0, "UserEffect":[], "enemyEffect":[]},
}

func get_card(index: int) -> CardResource:
	var cardRes = CardResource.new()
	cardRes.action = card[index]["Action"]
	cardRes.type = card[index]["Type"]
	cardRes.damage = card[index]["Damage"]
	cardRes.userEffect = card[index]["UserEffect"] if card[index]["UserEffect"].size() > 0 else []
	cardRes.enemyEffect = card[index]["enemyEffect"]
	return cardRes
