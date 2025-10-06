extends CharacterBody2D
class_name Player

@export var speed: float = 250
@export var run_speed: float = 350
@export var jump_force: float = -800  # negative = upward
@export var gravity: float = 2400     # stronger gravity feels better

@onready var attack_area: Area2D = $AttackArea2D

@onready var facing_right = true

func _ready():
	pass

func _physics_process(delta):
	# Flips attack area with sprite
	if facing_right:
		attack_area.scale.x = 1
	else:
		attack_area.scale.x = -1
	
	# Pulls the player down
	if not is_on_floor():
		velocity.y += gravity * delta
		
	move_and_slide()
