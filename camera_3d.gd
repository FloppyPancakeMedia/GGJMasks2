extends Camera3D

@export var cam_positioner: Marker3D

var is_active: bool = true
var speed: float = 10.0
var mouse_delta: Vector2





func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse_delta = event.relative
	
	if event.is_action_pressed("Action"):
		is_active = !is_active
	
	
	if event.is_action_pressed("Pause"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	if event.is_action_pressed("DebugCamPosition"):
		global_transform = cam_positioner.global_transform

func _physics_process(delta: float) -> void:
	if !is_active:
		return
	
	rotation.x -= mouse_delta.y * 0.1 * delta
	rotation.y -= mouse_delta.x * 0.1 * delta
	var dir = Input.get_vector("Left", "Right", "Up", "Down")
	global_position += transform.basis * Vector3(dir.x, 0, dir.y) * speed * delta
	mouse_delta = Vector2.ZERO
