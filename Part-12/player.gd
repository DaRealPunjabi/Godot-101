extends KinematicBody2D

onready var  ground_ray = get_node("ground_ray")
onready var  sprite = get_node("sprite")

const VELOCITY_RATE = 1500
const MAX_SPEED = 500
const FRICTION = -500
const GRAVITY = 2000
const JUMP_SPEED = -1000
const MIN_JUMP = -500

var acceleration = Vector2()
var velocity = Vector2()
var animation = "idle"

func _ready():
	set_physics_process(true)
	ground_ray.enabled = true
	
# this is now enabled by default in godot 3
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("ui_up"):
		if ground_ray.is_colliding():
			velocity.y = JUMP_SPEED
		else: print ("Is not colliding")
	if event.is_action_released("ui_up"):
		if velocity.y < MIN_JUMP:
			velocity.y = MIN_JUMP

func _physics_process(delta):
	acceleration.y = GRAVITY
	acceleration.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	acceleration.x *= VELOCITY_RATE
	if acceleration.x == 0:
		acceleration.x = velocity.x * FRICTION * delta
#	if Input.is_action_pressed("ui_up"):
#		if ground_ray.is_colliding():
#			velocity.y = JUMP_SPEED
#		else: print ("Is not colliding")

			
	velocity += acceleration * delta
	velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
	velocity = move_and_slide(velocity)
	
	if abs(velocity.x) < 10:
		velocity.x = 0
	
		# set animation
	if velocity.x == 0:
		animation = "idle"
	else:
		animation = "running"
	if velocity.x > 0:
		sprite.set_flip_h(false)
	elif velocity.x < 0:
		sprite.set_flip_h(true)
	sprite.play(animation)
