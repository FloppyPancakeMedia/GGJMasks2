extends Node3D


@export var cell: PackedScene

var cells: Array
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
