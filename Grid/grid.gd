@tool
class_name Grid
extends Node3D


@export var cell: PackedScene
@export var oob_thing: OOBThing
@export var x_size = 10
@export var y_size = 5
@export_tool_button("Populate Grid") var function: Callable = populate_grid
@export_tool_button("Clear Grid") var function1: Callable = clear_grid
var cells: Array
var things: Array[Thing]


func _ready() -> void:
	for c in get_children():
		if c is Cell:
			cells.append(c)


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


func populate_grid() -> void:
	## Fills grid with cells based on x_size and y_size

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
			if Engine.is_editor_hint(): # Ensure this only runs in the editor
				var edited_scene_root = get_tree().edited_scene_root
				if edited_scene_root != null:
					new_cell.owner = edited_scene_root
					new_cell.name = "(%s, %s)" % [i, j]
				else:
					# Fallback or error handling if not in a scene context
					new_cell.owner = self.owner 
		
		# Add row to Cell array
		cells.append(row)


func clear_grid() -> void:
	for c in get_children():
		if c is Cell:
			c.queue_free()
	
	cells.clear()
