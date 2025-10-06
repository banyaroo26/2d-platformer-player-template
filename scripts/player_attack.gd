extends State
class_name PlayerAttack

@export var animation_player: AnimationPlayer
@export var player: Player
@export var animated_sprite: AnimatedSprite2D

func _ready():
	animation_player.animation_finished.connect(_on_animation_player_animation_finished)

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "attack_v2":
		transition.emit(self, "player_idle")	

func Enter():
	animation_player.play("attack_v2")
	
func Physics_Update(_delta: float):
	# If moves during jump
	var direction = Input.get_axis("left", "right")
	
	if direction == 1:
		player.facing_right = true
		animated_sprite.flip_h = false
	elif direction == -1:
		player.facing_right = false
		animated_sprite.flip_h = true
		
	player.velocity.x = direction * player.speed
	
func Update(_delta:float):
	pass
	
func Exit():
	pass
