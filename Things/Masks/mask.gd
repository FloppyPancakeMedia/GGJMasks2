class_name Mask
extends Thing

############# PNGs for sprite ##################
const KING_MASK = preload("uid://6epfbholhw78")
const QUEEN_MASK = preload("uid://byyn7aoe4fyt7")
const ROOK_MASK = preload("uid://d27w04knnd0cn")
const STAGE_HAND_MASK = preload("uid://bouvr2qkr0xuc")

@export var sprite: Sprite3D
@export var type: ThingTypes.Masks


func pick_up() -> void:
	var player: Player = get_tree().get_first_node_in_group("Player")
	player.can_push = true
	WorldStore.world.cur_mask = self
	visible = false
	


func drop() -> void:
	var player: Player = get_tree().get_first_node_in_group("Player")
	player.can_push = false
