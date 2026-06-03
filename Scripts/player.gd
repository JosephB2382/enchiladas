extends CharacterBody2D

var on_ladder = false
const CLIMB_SPEED = 80

const SPEED = 130.0
const JUMP_VELOCITY = -260.0
const MAX_JUMPS = 2
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var jumps_left = MAX_JUMPS

@export var max_health : int = 3


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if on_ladder: 
		velocity.y = Input.get_axis("move_up", "move_down") * CLIMB_SPEED
	elif not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumps_left = MAX_JUMPS

	# Handle jump.
	if not on_ladder and Input.is_action_just_pressed("jump") and jumps_left > 0:
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1
	
	
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	
	#play animations
	if on_ladder:
		animated_sprite_2d.play("Idle")
	elif not is_on_floor():
		animated_sprite_2d.play("Jump")
	elif direction == 0:
		animated_sprite_2d.play("Idle")
	else:
		animated_sprite_2d.play("Run")

	
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = 0
	move_and_slide()

	
