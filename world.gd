class_name World
extends Node3D

var levels: Dictionary = {
	1: preload("uid://bxahgrji3n32b")
}

var cur_level: Level
var cur_mask: Mask
var switches: Array


func _ready() -> void:
	WorldStore.world = self
	change_level(1)
	


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Up"):
		cur_level.move_things(Vector2i.UP)
	if event.is_action_pressed("Down"):
		cur_level.move_things(Vector2i.DOWN)
	if event.is_action_pressed("Right"):
		cur_level.move_things(Vector2i.RIGHT)
	if event.is_action_pressed("Left"):
		cur_level.move_things(Vector2i.LEFT)
	


func check_win_condition() -> bool:
	for s in switches:
		if s.pressed == false:
			print("Y'ain't won yet...")
			return false
	
	print("You fockin' won, mate!!!")
	return true


func change_level(num: int) -> void:
	var level: Level = levels[num].instantiate()
	add_child(level)
	switches.clear()
	switches = get_tree().get_nodes_in_group("Switches") as Array[Switch]
