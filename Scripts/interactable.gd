extends Area2D


@export var scene_to_load: PackedScene = null


var _is_player_inside: bool = false


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	_is_player_inside = true


func _on_body_exited(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	
	_is_player_inside = false


func _input(event: InputEvent) -> void:
	if not _is_player_inside:
		return
	
	if event.is_action_pressed("interact"):
		#TODO: Advance interaction
		
		if scene_to_load != null:
			load_new_scene()
			return

func load_new_scene() -> void:
	var node_to_save: Node = get_tree().current_scene
	var scene: PackedScene = PackedScene.new()
	
	scene.pack(node_to_save)
	ResourceSaver.save(scene, "res://Scenes/temp/main_level.tscn")
	
	get_tree().change_scene_to_packed(scene_to_load)
