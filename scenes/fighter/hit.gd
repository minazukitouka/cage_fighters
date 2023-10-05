extends Node


func enter() -> void:
	owner.animation_player.stop()
	owner.animation_player.play('hit')


func leave() -> void:
	pass


func physics_process(delta: float) -> void:
	pass


func jump() -> void:
	pass


func move(input: Vector2) -> void:
	pass


func attack() -> void:
	pass


func hit_done() -> void:
	owner.change_state(owner.State.IDLING)
