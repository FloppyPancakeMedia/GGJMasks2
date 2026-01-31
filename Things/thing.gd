class_name Thing
extends Node3D

@export var sprite: Sprite3D
@export var dimensions: Vector2i = Vector2i(1, 1)
var cur_cell: Vector2i # Top left
#var occupied_cells: Array[Vector2i]


func _ready() -> void:
	pass # Set initial occupied cells


func initialize(pos: Vector2i) -> void:
	cur_cell = pos
	#for x in dimensions.x:
		#for y in dimensions.y:
			#occupied_cells.append(Vector2i(pos.x + x, pos.y + y))


func is_valid_move(dir: Vector2i) -> bool:
	#TODO: Move to arobitrary location
	var is_valid = true
	if dir == Vector2i.UP:
		for dx in range(dimensions.x):
			is_valid *= get_parent().get_collider(Vector2i(cur_cell.x+dx, cur_cell.y-1)) != null
	elif dir == Vector2i.DOWN:
		for dx in range(dimensions.x):
			is_valid *= (
				get_parent().get_collider(Vector2i(cur_cell.x+dx, cur_cell.y+dimensions.y))
				!= null
			)
	elif dir == Vector2i.LEFT:
		for dy in range(dimensions.y):
			is_valid *= get_parent().get_collider(Vector2i(cur_cell.x-1, cur_cell.y+dy)) != null
	elif dir == Vector2i.RIGHT:
		for dy in range(dimensions.y):
			is_valid *= (
				get_parent().get_collider(Vector2i(cur_cell.x+dimensions.x, cur_cell.y+dy))
				!= null
			)
	return is_valid

func move(dir: Vector2i) -> void: ## TODO
	# get possible collistion
	if is_valid_move(dir):
		cur_cell += dir


func is_occupying(cell: Vector2i) -> bool:
	return (cell.x >= cur_cell.x and cell.x < cur_cell.x + dimensions.x) and (cell.y <= cur_cell.y and cell.x < cur_cell.y + dimensions.y)
	
	return false
