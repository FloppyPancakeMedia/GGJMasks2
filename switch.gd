class_name Switch
extends Area3D


var pressed: bool = false



func _on_area_entered(area: Area3D) -> void:
	if area is Thing and area is not Player:
		pressed = true
		WorldStore.world.check_win_condition()



func _on_area_exited(area: Area3D) -> void:
	if area is Thing:
		pressed = false
