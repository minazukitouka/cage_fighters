extends Node


func enter() -> void:
	owner.animation_player.play('idle')


func leave() -> void:
	pass


func physics_process(delta: float) -> void:
	if owner.is_on_floor():
		owner.change_state(owner.State.IDLING)


func jump() -> void:
	pass


func move(input: Vector2) -> void:
	pass


func attack() -> void:
	pass
