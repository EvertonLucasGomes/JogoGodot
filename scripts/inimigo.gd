extends CharacterBody2D

const SPEED = 60.0
const JUMP_VELOCITY = -400.0

var direction := -1
var original_position := Vector2.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var texture := $texture
@onready var anim := $anim as AnimationPlayer

func _ready():
	original_position = position

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Move in the current direction.
	velocity.x = direction * SPEED

	# Check if the character has reached the left or right limit.
	if position.x <= original_position.x - 50:
		direction = 1
		texture.flip_h = true
	elif position.x >= original_position.x + 50:
		direction = -1
		texture.flip_h = false

	move_and_slide()


func _on_anim_animation_finished(anim_name):
	if anim_name == "hurt": 
		queue_free()
