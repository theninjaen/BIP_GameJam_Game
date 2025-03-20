extends Sprite2D


const ENOUGH_SNACKS: int = 3


@onready var area_2d: Area2D = $Area2D
@onready var button: Button = $"../../Button"
var snack_count: int = 0


func _ready() -> void:
	button.hide()


func _process(delta: float) -> void:
	if snack_count >= ENOUGH_SNACKS:
		button.show()
		GameManager.completed_cat_food = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("snacks"):
		snack_count += 1


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("snacks"):
		snack_count -= 1


func _on_button_button_down() -> void:
	var new_scene: PackedScene
	
	if FileAccess.file_exists("res://Scenes/temp/main_level.tscn"):
		new_scene = ResourceLoader.load("res://Scenes/temp/main_level.tscn")
	else:
		new_scene = ResourceLoader.load("res://Scenes/Levels/main_level.tscn")
		
	get_tree().change_scene_to_packed(new_scene)
