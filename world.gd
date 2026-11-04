class_name World
extends Node3D

var levels: Dictionary = {
	1: preload("res://Levels/level_1.tscn"),
	2: preload("res://Levels/Base/level.tscn")
}

var cur_level_num: int = 1
var cur_level: Level
var cur_mask: Mask
#var switches: Array


func _ready() -> void:
	WorldStore.world = self
	change_level(cur_level_num)
	cur_level.visible = false
	
	var sprite = $CanvasLayer/Sprite2D
	$CanvasLayer/Sprite2D2.hide()
	sprite.visible = true
	await get_tree().create_timer(2).timeout
	sprite.visible = false
	cur_level.visible = true
	


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
	var ending_screen = load("res://Things/Assets/Textures/Backdrop_texture.png")
	var sprite = $CanvasLayer/Sprite2D2
	sprite.texture = ending_screen
	sprite.visible = true
	
	

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
