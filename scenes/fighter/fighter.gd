extends CharacterBody3D

@export var jump_height = 0.8
@export var time_to_apex = 0.5
@export var move_speed = 1.0
# gravity = -2 * jump height / (time to apex)^2
var gravity
# jump speed = 2 * jump height / time to apex
var jump_speed

@onready var sprite_3d: Sprite3D = $Sprite3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

enum State {
	JUMPING, IDLING, WALKING, ATTACKING, ATTACKING2, HIT
}

var current_state = State.JUMPING
@onready var current_state_node = $States/Jumping

var can_combo = false


func _ready() -> void:
	gravity = Vector3(0, -2 * jump_height / pow(time_to_apex, 2), 0)
	jump_speed = 2 * jump_height / time_to_apex
	animation_player.animation_finished.connect(handle_finish_animation)


func _physics_process(delta: float) -> void:
	velocity += gravity * delta
	move_and_slide()
	current_state_node.physics_process(delta)


func jump() -> void:
	current_state_node.jump()


func change_state(state: State) -> void:
	if current_state == state:
		return
	current_state_node.leave()
	current_state = state

	match state:
		State.JUMPING: current_state_node = $States/Jumping
		State.IDLING: current_state_node = $States/Idling
		State.WALKING: current_state_node = $States/Walking
		State.ATTACKING: current_state_node = $States/Attacking
		State.ATTACKING2: current_state_node = $States/Attacking2
		State.HIT: current_state_node = $States/Hit

	current_state_node.enter()


func move(input: Vector2) -> void:
	current_state_node.move(input)


func attack() -> void:
	current_state_node.attack()


func handle_finish_animation(anim_name: StringName):
	if anim_name == 'attack' or anim_name == 'attack2':
		current_state_node.attack_done()
	if anim_name == 'hit':
		current_state_node.hit_done()


func disable_combo():
	can_combo = false


func enable_combo():
	can_combo = true
