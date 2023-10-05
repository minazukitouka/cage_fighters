extends Node


func enter() -> void:
	owner.animation_player.play('walk')


func leave() -> void:
	pass


func physics_process(delta: float) -> void:
	pass


func jump() -> void:
	owner.velocity.y = owner.jump_speed
	owner.change_state(owner.State.JUMPING)


func move(input: Vector2) -> void:
	if input.is_zero_approx():
		owner.change_state(owner.State.IDLING)
	owner.velocity.x = input.x * owner.move_speed
	owner.velocity.z = input.y * owner.move_speed
	if input.x < 0:
		owner.look_at(owner.global_position + Vector3.LEFT)
		owner.sprite_3d.flip_h = true
	if input.x > 0:
		owner.look_at(owner.global_position + Vector3.RIGHT)
		owner.sprite_3d.flip_h = false


func attack() -> void:
	owner.change_state(owner.State.ATTACKING)
