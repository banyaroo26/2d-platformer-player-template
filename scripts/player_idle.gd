extends State
class_name PlayerIdle

@export var animation_player: AnimationPlayer
@export var player: Player

func Enter():
	animation_player.play("idle")

func Update(_delta:float):
	animation_player.play("idle")
	
func Physics_Update(_delta: float):
	# If moves
	if Input.get_axis("left", "right"):
		transition.emit(self, "player_walk")
	
	# If jumps
	if Input.is_action_just_pressed("jump"):
		transition.emit(self, "player_jump")
		
	# If attacks
	if Input.is_action_just_pressed("left_mb"):
		transition.emit(self, "player_attack")
		
	# If in the air
	if not player.is_on_floor():
		transition.emit(self, "player_fall")
		
func Exit():
	pass
