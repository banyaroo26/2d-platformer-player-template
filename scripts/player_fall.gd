extends State
class_name PlayerFall

@export var animation_player: AnimationPlayer
@export var player: Player
@export var animated_sprite: AnimatedSprite2D

func Enter():
	animation_player.play("fall")

func Update(_delta:float):
	pass
	
func Physics_Update(_delta: float):
	# If moves falling mid air
	var direction = Input.get_axis("left", "right")
	
	if direction == 1:
		animated_sprite.flip_h = !player.right_flipped
		player.right_flipped = true
	elif direction == -1:
		animated_sprite.flip_h = player.right_flipped
		player.right_flipped = true
		
	player.velocity.x = direction * player.speed

	# If returned to the ground
	if player.is_on_floor():
		transition.emit(self, "player_idle")
		
func Exit():
	pass
