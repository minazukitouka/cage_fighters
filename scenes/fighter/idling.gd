extends Node


func enter() -> void:
	owner.animation_player.play('idle')
	owner.velocity.x = 0
	owner.velocity.z = 0


func leave() -> void:
	pass


func physics_process(delta: float) -> void:
	pass


func jump() -> void:
	owner.velocity.y = owner.jump_speed
	owner.change_state(owner.State.JUMPING)


func move(input: Vector2) -> void:
	if not input.is_zero_approx():
		owner.change_state(owner.State.WALKING)


func attack() -> void:
	owner.change_state(owner.State.ATTACKING)
