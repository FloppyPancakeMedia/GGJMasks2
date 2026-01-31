extends Node3D


@export var cell: PackedScene

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


func is_occupied(cell: Vector2i) -> bool:
	for t in things:
		if t.is_occupying(cell):
			return true
	
	return false
