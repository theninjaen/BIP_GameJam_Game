extends Node2D

@export var interactions: Dictionary

@onready var his_message: Label = $CoffeeInteraction/AngryDude/HisMessage

func _ready() -> void:
	if GameManager.completed_cat_food:
		var cat_food := get_node(interactions["cat"])
		cat_food.set_process_mode(Node.ProcessMode.PROCESS_MODE_DISABLED)
	if GameManager.completed_coffee:
		var coffee := get_node(interactions["coffee"])
		coffee.set_process_mode(Node.ProcessMode.PROCESS_MODE_DISABLED)
		if GameManager.salted_coffee:
			his_message.text = "THis shit sucks ass.\nWhy is it SALTY?!\nI want my money back"
		else:
			his_message.text = "This is really bad coffee,\nwhy can't you do anything right"
