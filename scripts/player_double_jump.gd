extends State
class_name PlayerDoubleJump

@export var animation_player: AnimationPlayer
@export var player: Player
@export var animated_sprite: AnimatedSprite2D

func Enter():
	player.velocity.y = player.jump_force * 85/100
	animation_player.play('jump')
	
func Update(_delta:float):
	pass
	
func Physics_Update(_delta: float):
	# If moves during double jump
	var direction = Input.get_axis("left", "right")
	
	if direction == 1:
		player.facing_right = true
		animated_sprite.flip_h = false
	elif direction == -1:
		player.facing_right = false
		animated_sprite.flip_h = true
		
	player.velocity.x = direction * player.speed
		
	# If falls after jump peak
	if player.velocity.y > 0 and animation_player.current_animation != "fall":
		transition.emit(self, "player_fall")
	
func Exit():
	pass
