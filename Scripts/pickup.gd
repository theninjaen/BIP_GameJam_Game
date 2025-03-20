extends Sprite2D

class_name Pickup

var is_sprite_clicked: bool = false
var position_delta := Vector2(0, 0)
var origin: Vector2

func pick_up():
	if Input.is_action_just_pressed("mouse_click"):
		if is_pixel_opaque(get_local_mouse_position()):
			is_sprite_clicked = true
			position_delta = global_position - get_global_mouse_position()
	
	if Input.is_action_pressed("mouse_click") and is_sprite_clicked:
		global_position = get_global_mouse_position() + position_delta
	
	if Input.is_action_just_released("mouse_click"):
		is_sprite_clicked = false
		rotation = 0
		if origin:
			position = origin
