extends Pickup


const MAX_DIST: int = 500
const EMIT_ANGLE: int = 50
const SPEED: int = 5

@export var target: Node2D
@onready var particles: CPUParticles2D = $CPUParticles2D


func _process(delta: float) -> void:
	pick_up()
	
	var target_x_dist: float =\
			global_position.distance_to(target.global_position)
	var rotation_target: float = remap(target_x_dist, 0.0, MAX_DIST, -180, 0)
	rotation_target = clamp(rotation_target, -180, 0)
	if global_position.x - target.global_position.x < 0:
		rotation_target = (rotation_target * -1) -360
	rotation_degrees = lerp(rotation_degrees, rotation_target, delta * SPEED)
	
	if rotation_degrees < -90 and rotation_degrees > -270:
		particles.emitting = true
	else:
		particles.emitting = false
	
