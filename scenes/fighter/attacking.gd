extends Node


func enter() -> void:
	owner.animation_player.play('attack')
	owner.velocity.x = 0
	owner.velocity.z = 0


func leave() -> void:
	pass


func physics_process(delta: float) -> void:
	pass


func jump() -> void:
	pass


func move(input: Vector2) -> void:
	pass


func attack() -> void:
	if owner.can_combo:
		owner.change_state(owner.State.ATTACKING2)


func attack_done() -> void:
	owner.change_state(owner.State.IDLING)
