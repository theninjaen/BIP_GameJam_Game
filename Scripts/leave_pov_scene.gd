extends Node2D


func _on_button_button_down() -> void:
	var new_scene: PackedScene
	
	if FileAccess.file_exists("res://Scenes/temp/main_level.tscn"):
		new_scene = ResourceLoader.load("res://Scenes/temp/main_level.tscn")
	else:
		new_scene = ResourceLoader.load("res://Scenes/Levels/main_level.tscn")
	
	get_tree().change_scene_to_packed(new_scene)
