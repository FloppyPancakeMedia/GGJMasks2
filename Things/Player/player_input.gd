class_name PlayerInput
extends Node


@export var player: Thing


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Down"):
		player.move(Vector2.DOWN)
	
	if event.is_action_pressed("Up"):
		player.move(Vector2.UP)
	
	if event.is_action_pressed("Left"):
		player.move(Vector2.LEFT)
	
	if event.is_action_pressed("Right"):
		player.move(Vector2.RIGHT)
	
	if event.is_action_pressed("Action"):
		pass ## TODO
