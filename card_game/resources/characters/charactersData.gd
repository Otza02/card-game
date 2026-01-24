extends Node

const characters = {
	0: {"MaxArmor":20, "Damage":5, "Ability":"none"},
	1: {"MaxArmor":30, "Damage":2, "Ability":"none"},
	2: {"MaxArmor":10, "Damage":5, "Ability":"none"},
	3: {"MaxArmor":15, "Damage":4, "Ability":"none"},
	4: {"MaxArmor":25, "Damage":3, "Ability":"none"},
}

func random_character() -> CharacterResource:
	var index = randi_range(0, characters.size() - 1)
	return get_character(index)

func get_character(index: int) -> CharacterResource:
	var characterRes = CharacterResource.new()
	characterRes.characterName = "NoName"
	characterRes.maxArmor = characters[index]["MaxArmor"]
	characterRes.damage = characters[index]["Damage"]
	characterRes.ability = characters[index]["Ability"]
	return characterRes
