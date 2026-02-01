class_name Mask
extends Thing

############# PNGs for sprite ##################
#const KING_MASK = preload("uid://6epfbholhw78")
#const QUEEN_MASK = preload("uid://byyn7aoe4fyt7")
#const ROOK_MASK = preload("uid://d27w04knnd0cn")
##const STAGE_HAND_MASK = preload("uid://bouvr2qkr0xuc")
#const STAGE_HAND_MASK = preload("res://Things/Assets/Masks/Stage Hand Mask.png")
#

enum mask_variants {
	HAND,
	KING,
	QUEEN,
	ROOK,
}

#@export var sprite: Sprite3D
@export var type: ThingTypes.Masks
@export var mask_type : mask_variants

##### I tried getting fancy with other cool stuff, and I could not succeed within the time limit

func _ready() -> void:
	var anim = $AnimatedSprite3D
	#anim.animation = "mask_frames"
	if mask_type == mask_variants.HAND:
		anim.animation = "mask_stagehand"
	elif mask_type == mask_variants.KING:
		#print(mask_type)
		#print(str(anim.frame))
		#anim.frame = 1
		#print(str(anim.frame))
		anim.animation = "mask_king"
		#print(str(anim))
		print(str(anim.animation))
	elif mask_type == mask_variants.QUEEN:
		anim.frame = 2
	elif mask_type == mask_variants.ROOK:
		anim.frame = 3


func pick_up() -> void:
	if WorldStore.world.cur_mask:
		await WorldStore.world.cur_mask.drop()
	var player: Player = get_tree().get_first_node_in_group("Player")
	if mask_type == mask_variants.HAND:
		player.can_push = true
	if mask_type == mask_variants.KING:
		pass
	WorldStore.world.cur_mask = self
	visible = false
	


func drop() -> void:
	var player: Player = get_tree().get_first_node_in_group("Player")
	global_position = player.global_position
	if mask_type == mask_variants.HAND:
		player.can_push = false
	visible = true
