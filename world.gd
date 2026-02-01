class_name World
extends Node3D

var levels: Dictionary = {
	1: preload("uid://bxahgrji3n32b")
}

var cur_level: Level


func _ready() -> void:
	change_level(1)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Up"):
		print("Calling move up")
		cur_level.move_things(Vector2i.UP)
	if event.is_action_pressed("Down"):
		cur_level.move_things(Vector2i.DOWN)
	if event.is_action_pressed("Right"):
		cur_level.move_things(Vector2i.RIGHT)
	if event.is_action_pressed("Left"):
		cur_level.move_things(Vector2i.LEFT)


func change_level(num: int) -> void:
	var level: Level = levels[num].instantiate()
	add_child(level)
