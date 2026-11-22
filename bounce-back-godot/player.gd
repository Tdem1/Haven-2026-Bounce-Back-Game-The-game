extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -900.0
var coins=0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta*2
	if  is_on_floor():
		$AnimatedSprite2D.animation="walk"
	# Handle jump.
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up")) and $AnimatedSprite2D.animation=="walk":
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.animation="jump"
		
	if Input.is_action_just_pressed("respawn"):
		position = Vector2(0,0)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			velocity.y-=100
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()


func _on_coin_get_coin():
	coins+=1
