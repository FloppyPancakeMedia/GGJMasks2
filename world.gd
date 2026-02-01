class_name World
extends Node3D

var levels: Dictionary = {
	1: preload("uid://bxahgrji3n32b")
	
}

var cur_level_num: int = 1
var cur_level: Level
var cur_mask: Mask
#var switches: Array


func _ready() -> void:
	WorldStore.world = self
	change_level(cur_level_num)
	


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Up"):
		cur_level.move_things(Vector2i.UP)
	if event.is_action_pressed("Down"):
		cur_level.move_things(Vector2i.DOWN)
	if event.is_action_pressed("Right"):
		cur_level.move_things(Vector2i.RIGHT)
	if event.is_action_pressed("Left"):
		cur_level.move_things(Vector2i.LEFT)
	if event.is_action_pressed("Reset"):
		reset_level()
	
	#var switchList = get_tree().get_nodes_in_group("Switch")
	#print(switchList)
	


func check_win_condition() -> bool:
	var switches = get_tree().get_nodes_in_group("Switch")
	for s in switches:
		if s.pressed == false:
			print("Y'ain't won yet...")
			return false
	
	print("You fockin' won, mate!!!")
	show_victory_screen()
	return true

func show_victory_screen():
	var sprite = $CanvasLayer/Sprite2D
	sprite.visible = true
	await get_tree().create_timer(0.5).timeout
	sprite.visible = false
	

func reset_level():
	cur_level.queue_free()
	change_level(cur_level_num)

func change_level(num: int) -> void:
	cur_level = levels[num].instantiate()
	add_child(cur_level)
	#switches.clear()
	#await(level.ready)
	#var stuff = get_tree().get_nodes_in_group("Switch")
	#switches = get_tree().get_nodes_in_group("Switch") 
