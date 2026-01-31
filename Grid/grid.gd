extends Node3D


@export var cell: PackedScene
@export var oob_thing: OOBThing

var cells: Array
var things: Array[Thing]
const x_size = 10
const y_size = 5

func _ready() -> void:
	# Populate grid with Cells
	for i in x_size:
		var row: Array[Cell]
		for j in y_size:
			# Setup cell
			var new_cell: Cell = cell.instantiate()
			new_cell.coords = Vector2i(i, j)
			new_cell.position = Vector3(i + 1, 0, j + 1) ## TODO: Figure out later
			
			# Add to temp row array
			row.append(new_cell)
			add_child(new_cell)
		
		# Add row to Cell array
		cells.append(row)


func get_collider(cell: Vector2i) -> Thing:
	# Check if out of bounds
	if cell.x >= x_size or cell.x < 0 or cell.y >= y_size or cell.y < 0:
		return oob_thing
	
	# Check if occupied
	for t in things:
		if t.is_occupying(cell):
			return t
	
	# Return nothing if 
	return null
