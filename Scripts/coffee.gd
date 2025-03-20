extends Sprite2D

var salt_content: float = 0
var sugar_content: float = 0

func _process(delta: float) -> void:
	if salt_content + sugar_content < 100:
		return
	
	GameManager.completed_coffee = true
	GameManager.salted_coffee = true if salt_content > 25 else false
	
	var new_scene: PackedScene
	
	if FileAccess.file_exists("res://Scenes/temp/main_level.tscn"):
		new_scene = ResourceLoader.load("res://Scenes/temp/main_level.tscn")
	else:
		new_scene = ResourceLoader.load("res://Scenes/Levels/main_level.tscn")
		
	get_tree().change_scene_to_packed(new_scene)
