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


func move(dir: Vector2i) -> void: ## TODO
	# check move
	# execute
	# set occupied cells
	pass


func is_occupying(cell: Vector2i) -> bool:
	return (cell.x >= cur_cell.x and cell.x < cur_cell.x + dimensions.x) and (cell.y <= cur_cell.y and cell.x < cur_cell.y + dimensions.y)
	
	return false
