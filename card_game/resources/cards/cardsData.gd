extends Node
class_name CardsData

const Action: = {
	ATTACK = "Attack",
	DEFENSE = "Defense",
	STRATEGY = "Strat"
}

const Type = {
	ANY = "Any",
	FIRE = "Fire",
	ICE = "Ice",
	WATER = "Water"
}

const card = {
	1:{"Action":Action.ATTACK, "Type":Type.FIRE, "Damage":3, "EffectOnUser":"", "EffectOnEnemy":""},
	2:{"Action":Action.ATTACK, "Type":Type.FIRE, "Damage":4, "EffectOnUser":"", "EffectOnEnemy":""},
	3:{"Action":Action.ATTACK, "Type":Type.FIRE, "Damage":2, "EffectOnUser":"", "EffectOnEnemy":""},
	4:{"Action":Action.ATTACK, "Type":Type.FIRE, "Damage":1, "EffectOnUser":"", "EffectOnEnemy":""},
	5:{"Action":Action.ATTACK, "Type":Type.FIRE, "Damage":1, "EffectOnUser":"", "EffectOnEnemy":""},
	
	6:{"Action":Action.DEFENSE, "Type":Type.FIRE, "Damage":1, "EffectOnUser":"", "EffectOnEnemy":""},
	7:{"Action":Action.DEFENSE, "Type":Type.FIRE, "Damage":1, "EffectOnUser":"", "EffectOnEnemy":""},
	8:{"Action":Action.DEFENSE, "Type":Type.FIRE, "Damage":1, "EffectOnUser":"", "EffectOnEnemy":""},
	9:{"Action":Action.DEFENSE, "Type":Type.FIRE, "Damage":1, "EffectOnUser":"", "EffectOnEnemy":""},
	10:{"Action":Action.DEFENSE, "Type":Type.FIRE, "Damage":1, "EffectOnUser":"", "EffectOnEnemy":""},
}
