extends Node


func enter() -> void:
	owner.animation_player.play('attack2')


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


func attack_done() -> void:
	owner.change_state(owner.State.IDLING)
