extends Resource
class_name CardResource

@export_enum("Attack", "Defend", "Strategy") var action: String
@export var type: String
@export_range(0, 10) var damage: int
@export var effect: String
