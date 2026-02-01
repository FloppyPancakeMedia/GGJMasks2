class_name Thing
extends Area3D

@export var raycasts: Node3D
@export var moveable: bool = false
@export var pushable: bool = true
@export var can_push: bool = false


func move(dir: Vector2i) -> bool:
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
			global_position += Vector3(dir.x, global_position.y, dir.y)
			return true
		if collider is Wall:
			return false
		if collider is Thing and can_push:
			if collider.pushable:
				if collider.move(dir):
					## TODO: Currently this will move an object twice if multiple objects are moveable and push into each other
					global_position += Vector3(dir.x, global_position.y, dir.y)
					return true
	else:
		global_position += Vector3(dir.x, global_position.y, dir.y)
		return true
	
	return false


func check_is_mask(collider) -> bool:
	if self is not Player:
		return false
	if collider is Mask:
		if collider is StageHandMask:
			collider.pick_up()
			
		return true
	
	return false
