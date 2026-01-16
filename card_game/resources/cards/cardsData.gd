extends Node


enum Action {ATTACK, DEFENSE, STRATEGY}
enum Type {ANY, FIRE, ICE, WATER}

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
