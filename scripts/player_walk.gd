extends State
class_name PlayerWalk

@export var player: Player
@export var animation_player: AnimationPlayer
@export var animated_sprite: AnimatedSprite2D

var multiplier
var animation

func Enter():
	pass

func Update(_delta:float):
	pass
	
func Physics_Update(_delta: float):
	# Player moves 	
	var direction = Input.get_axis("left", "right")
	
	if Input.is_action_pressed("shift"):
		multiplier = player.run_speed
		animation = "run"
	else:
		multiplier = player.speed
		animation = "walk"
		
	if direction == 1:
		animated_sprite.flip_h = !player.right_flipped
		player.right_flipped = true
		animation_player.play(animation)
	elif direction == -1:
		animated_sprite.flip_h = player.right_flipped
		player.right_flipped = true
		animation_player.play(animation)
	else:
		transition.emit(self, "player_idle")	
		
	player.velocity.x = direction * multiplier
	
	# Player jumps
	if Input.is_action_just_pressed("jump"):
		transition.emit(self, "player_jump")
		
	# Player falls
	if not player.is_on_floor():
		transition.emit(self, "player_fall")
		
	# If attacks
	if Input.is_action_just_pressed("left_mb"):
		transition.emit(self, "player_attack")	
		
func Exit():
	pass
