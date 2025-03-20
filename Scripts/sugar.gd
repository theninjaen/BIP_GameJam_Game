extends Pickup


const MAX_DIST: int = 500
const EMIT_ANGLE: int = 50
const ANGULAR_SPEED: int = 5
const FILL_SPEED: int = 20

@onready var particles: CPUParticles2D = $CPUParticles2D

@export var coffee: Sprite2D
@export var content := Enums.additives.SALT

var target: Node2D


func _ready() -> void:
	origin = position
	target = coffee.get_child(0)


func _process(delta: float) -> void:
	pick_up()
	rotate_sprite(delta)
	
	if particles.emitting:
		match content:
			Enums.additives.SALT:
				coffee.salt_content += FILL_SPEED * delta
			Enums.additives.SUGAR:
				coffee.sugar_content += FILL_SPEED * delta

func rotate_sprite(delta: float) -> void:
	var target_x_dist: float =\
			global_position.distance_to(target.global_position)
	var rotation_target: float = remap(target_x_dist, 0.0, MAX_DIST, -180, 0)
	rotation_target = clamp(rotation_target, -180, 0)
	if global_position.x - target.global_position.x < 0:
		rotation_target = (rotation_target * -1) -360
	if is_sprite_clicked:
		rotation_degrees = lerp(rotation_degrees, rotation_target, delta * ANGULAR_SPEED)
	
	if rotation_degrees < -90 and rotation_degrees > -270:
		particles.emitting = true
	else:
		particles.emitting = false
