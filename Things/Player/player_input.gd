class_name PlayerInput
extends Node


@export var player: CharacterBody3D
@export var speed: float = 6.0
@export var move_duration: float = 0.3
var direction: Vector2i
var is_moving: bool = false
var current_grid_position: Vector2i = Vector2i.ZERO
signal movement_requested(direction: Vector2i)
signal position_requested(position: Vector2i)
signal validMove(at_position: Vector2i)
signal invalidMove(at_position: Vector2i)

func _ready() -> void:
	if player == null:
		var parent_node := get_parent()
		if parent_node is CharacterBody3D:
			player = parent_node

func _physics_process(delta: float) -> void:
	direction = Vector2i.ZERO
	if Input.is_action_just_pressed("Down", false):
		direction += Vector2i.DOWN
	if Input.is_action_just_pressed("Up", false):
		direction += Vector2i.UP
	if Input.is_action_just_pressed("Left", false):
		direction += Vector2i.LEFT
	if Input.is_action_just_pressed("Right", false):
		direction += Vector2i.RIGHT
	
	if not is_moving:
		if direction == Vector2i.DOWN:
			# print("INPUT--_on_character_move_requested: DOWN")
			var target = current_grid_position + direction
			emit_signal("movement_requested", target)
		elif direction == Vector2i.UP:
			# print("INPUT--_on_character_move_requested: UP")
			var target = current_grid_position + direction
			emit_signal("movement_requested", target)
		elif direction == Vector2i.LEFT:
			# print("INPUT--_on_character_move_requested: LEFT")
			var target = current_grid_position + direction
			emit_signal("movement_requested", target)
		elif direction == Vector2i.RIGHT:
			# print("INPUT--_on_character_move_requested: RIGHT")
			var target = current_grid_position + direction
			emit_signal("movement_requested", target)

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
	direction = Vector2i.ZERO
	current_grid_position = new_position
	var target_position = Vector3(new_position.x + 1, player.position.y, new_position.y + 1)
	is_moving = true
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(player, "position", target_position, move_duration)
	tween.tween_callback(func(): is_moving = false)

