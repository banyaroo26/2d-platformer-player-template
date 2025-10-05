extends State
class_name PlayerAttack

@export var animation_player: AnimationPlayer
@export var player: Player
@export var animated_sprite: AnimatedSprite2D

func _ready():
	animation_player.animation_finished.connect(_on_animation_player_animation_finished)

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "attack":
		transition.emit(self, "player_idle")	

func Enter():
	animation_player.play("attack")
	
func Physics_Update(_delta: float):
	# If moves during jump
	var direction = Input.get_axis("left", "right")
	
	if direction == 1:
		animated_sprite.flip_h = !player.right_flipped
		player.right_flipped = true
	elif direction == -1:
		animated_sprite.flip_h = player.right_flipped
		player.right_flipped = true
		
	player.velocity.x = direction * player.speed
	
func Update(_delta:float):
	pass
	
func Exit():
	pass
