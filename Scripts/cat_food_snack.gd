extends Sprite2D


@onready var cat_food_snack: RigidBody2D = $".."


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_click"):
		if is_pixel_opaque(get_local_mouse_position()):
			# TODO: Play eat sound
			cat_food_snack.queue_free()
