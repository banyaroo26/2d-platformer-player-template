extends CharacterBody2D
class_name Player

@export var speed: float = 250
@export var run_speed: float = 350
@export var jump_force: float = -800  # negative = upward
@export var gravity: float = 2400     # stronger gravity feels better

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var right_flipped = true
var up_time
var total_time

func _ready():
	up_time = -(jump_force)/gravity
	total_time = 2 * up_time

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
