extends KinematicBody2D


const VELOCITY_RATE = 1500
const MAX_SPEED = 500
const FRICTION = -500
const GRAVITY = 2000
const UP = Vector2(0,-1)

var acceleration = Vector2()
var velocity = Vector2()

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	acceleration.y = GRAVITY
	acceleration.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	acceleration.x *= VELOCITY_RATE
	if acceleration.x == 0:
		acceleration.x = velocity.x * FRICTION * delta
	velocity += acceleration * delta
	velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
#	if is_colliding():
#		var n = get_collision_normal()
#		motion = n.slide(motion)
#		vel = n.slide(vel)
#		move(motion)

# using move_and_collide
#	var collision = move_and_collide(velocity * delta)
#	if collision:
#			velocity = velocity.slide(collision.normal)

# using move_and_slide
	velocity = move_and_slide(velocity)
