extends Node

@export var fighter: CharacterBody3D


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed('p1_jump'):
		fighter.jump()
	var move_input = Input.get_vector('p1_move_left', 'p1_move_right', 'p1_move_up', 'p1_move_down')
	fighter.move(move_input)
	if Input.is_action_just_pressed('p1_attack'):
		fighter.attack()
