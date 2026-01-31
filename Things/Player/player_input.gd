class_name PlayerInput
extends Node


@export var player: CharacterBody3D
@export var speed: float = 6.0
var direction: Vector2i
signal movement_requested(direction: Vector2i)
signal position_requested(position: Vector2i)

func _ready() -> void:
	if player == null:
		var parent_node := get_parent()
		if parent_node is CharacterBody3D:
			player = parent_node

func _physics_process(delta: float) -> void:
	direction = Vector2i.ZERO
	#maybe
	if Input.is_action_just_pressed("Down", false):
		direction += Vector2i.DOWN
	if Input.is_action_just_pressed("Up", false):
		direction += Vector2i.UP
	if Input.is_action_just_pressed("Left", false):
		direction += Vector2i.LEFT
	if Input.is_action_just_pressed("Right", false):
		direction += Vector2i.RIGHT
	
	if direction == Vector2i.DOWN:
		# print("INPUT--_on_character_move_requested: DOWN")
		emit_signal("movement_requested", Vector2i.DOWN)
	elif direction == Vector2i.UP:
		# print("INPUT--_on_character_move_requested: UP")
		emit_signal("movement_requested", Vector2i.UP)
	elif direction == Vector2i.LEFT:
		# print("INPUT--_on_character_move_requested: LEFT")
		emit_signal("movement_requested", Vector2i.LEFT)
	elif direction == Vector2i.RIGHT:
		# print("INPUT--_on_character_move_requested: RIGHT")
		emit_signal("movement_requested", Vector2i.RIGHT)

# func _unhandled_input(event: InputEvent) -> void:
# 	if event.is_action_pressed("Down"):
# 		player.move(Vector2.DOWN)
	
# 	if event.is_action_pressed("Up"):
# 		player.move(Vector2.UP)
	
# 	if event.is_action_pressed("Left"):
# 		player.move(Vector2.LEFT)
	
# 	if event.is_action_pressed("Right"):
# 		player.move(Vector2.RIGHT)
	
# 	if event.is_action_pressed("Action"):
# 		pass ## TODO


func _on_character_move_validated(new_position: Vector2i) -> void:
	pass # Replace with function body.
