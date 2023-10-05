extends Area3D


func _ready() -> void:
	area_entered.connect(enter_hit_state)


func enter_hit_state(area: Area3D) -> void:
	if owner == area.owner:
		return
	owner.change_state(owner.State.HIT)
