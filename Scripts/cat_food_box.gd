extends Sprite2D


const MOVE_SPEED: int = 5
const ROTATION_SPEED: int = 5

@onready var animation_body: AnimatableBody2D = $AnimationBody2D

var is_sprite_clicked: bool = false
var position_delta := Vector2(0, 0)
var position_target: Vector2
var rotation_target: float = 0
var origin: Vector2


func _ready() -> void:
	origin = position
	position_target = origin


func _process(delta: float) -> void:
	pick_up()
	position = position.lerp(position_target, MOVE_SPEED * delta)
	rotation_degrees = \
			lerp(rotation_degrees, rotation_target, ROTATION_SPEED * delta)
	animation_body.rotation_degrees = 0
	animation_body.global_position = global_position


func pick_up():
	if Input.is_action_just_pressed("mouse_click"):
		if is_pixel_opaque(get_local_mouse_position()):
			is_sprite_clicked = true
			rotation_target = -75
			position_delta = global_position - get_global_mouse_position()
	
	if Input.is_action_pressed("mouse_click") and is_sprite_clicked:
		position_target = get_global_mouse_position() + position_delta
	
	if Input.is_action_just_released("mouse_click"):
		is_sprite_clicked = false
		rotation_target = 0
		if origin:
			position_target = origin
