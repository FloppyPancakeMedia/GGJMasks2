class_name Level
extends Node3D

var things: Array[Thing]
@export var things_holder: Node3D


func _ready() -> void:
	var world = get_tree().get_first_node_in_group("World")
	world.cur_level = self
	for c in things_holder.get_children():
		if c is Thing:
			things.append(c)


func move_things(dir: Vector2i) -> void:
	for t in things:
		if t.moveable:
			t.move(dir)
