extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var currentFrame = 0
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	currentFrame += 1
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$Sprite2D.flip_h = bool(1.0-direction)
		if currentFrame>2:
			currentFrame = 0
			if is_on_floor():
				$Sprite2D.frame = $Sprite2D.frame+1 if $Sprite2D.frame <9 else 0
			else:
				if velocity.y>0.0:
					$Sprite2D.frame = 5
				else:
					$Sprite2D.frame = 4
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
