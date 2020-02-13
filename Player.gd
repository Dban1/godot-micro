extends KinematicBody2D

const SPEED = 125
const GRAVITY = 40
const JUMP_POWER = -650
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var on_ground := false

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	else:
		velocity.x = 0
		
	if Input.is_action_pressed("ui_up") and on_ground:
			velocity.y = JUMP_POWER
		
	velocity.y += GRAVITY
	
	on_ground = is_on_floor()
	
	velocity = move_and_slide(velocity, FLOOR)
