extends CharacterBody2D


@onready var floor_ray: RayCast2D = $RayCast2D


@export var speed: float = 300.0
@export var jump_velocity: float = -400.0


func _physics_process(delta: float) -> void:
	movement(delta)


func movement(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	
	# Handle left-right movement
	var direction: float = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
