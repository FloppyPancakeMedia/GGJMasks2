class_name Thing
extends Area3D

@export var raycasts: Node3D
@export var moveable: bool = false
@export var pushable: bool = true
@export var can_push: bool = false
var tweening: bool = false


func move(dir: Vector2i) -> bool:
	if tweening:
		return false
	# Retrieve appropriate raycast to check for neighbor
	var raycast: RayCast3D
	if dir == Vector2i.UP:
		raycast = raycasts.get_child(0)
	elif dir == Vector2i.DOWN:
		raycast = raycasts.get_child(1)
	elif dir == Vector2i.LEFT:
		raycast = raycasts.get_child(2)
	else:
		raycast = raycasts.get_child(3)
	
	# Check raycast
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if check_is_mask(collider):
			#global_position += Vector3(dir.x, global_position.y, dir.y)
			execute_move(global_position + Vector3(dir.x, global_position.y, dir.y))
			return true
		if collider is Wall:
			return false
		if collider is Thing and can_push:
			if collider.pushable:
				if collider.move(dir):
					## TODO: Currently this will move an object twice if multiple objects are moveable and push into each other
					execute_move(global_position + Vector3(dir.x, global_position.y, dir.y))
					return true
	else:
		#var tween: Tween = get_tree().create_tween()
		execute_move(global_position + Vector3(dir.x, global_position.y, dir.y))
		return true
	
	return false


func execute_move(pos: Vector3):
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", pos, 0.3)
	tween.finished.connect(stop_tweening)
	tweening = true
	if self is Player:
		$PlayerSprite.play("default")


func check_is_mask(collider) -> bool:
	if self is not Player:
		return false
	if collider is Mask:
		if collider is StageHandMask:
			collider.pick_up()
			
		return true
	
	return false


func stop_tweening():
	tweening = false
	if self is Player:
		$PlayerSprite.stop()
