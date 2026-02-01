extends CharacterBody3D
signal move_requested(direction: Vector2i)
signal moveValidated(new_position: Vector2i)
signal gridMoveRequested(position: Vector2i)

func _on_player_input_movement_requested(position: Vector2i) -> void:
	# print ("PLAYER--_on_player_input_movement_requested: %s" % position)
	emit_signal("gridMoveRequested", position)
	pass 

func _on_player_input_position_requested(position: Vector2i) -> void:
	pass 

func _on_grid_invalid_move(at_position: Vector2i) -> void:
	print("PLAYER--_on_grid_invalid_move: %s" % at_position)
	pass 

func _on_grid_valid_move(new_position: Vector2i) -> void:
	emit_signal("moveValidated", new_position)
	print("PLAYER--_on_grid_valid_move: %s" % new_position)
	pass 
