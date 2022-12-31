extends Area2D


export var speed = 400

var screensize
var extents
var vel = Vector2()

func _ready():
	set_physics_process(true)
	screensize = get_viewport_rect().size
#	extents = get_node("sprite").get_texture().get_size() / 2
	extents = get_node("collision").get_shape().get_extents()
	
	position = screensize / 2
	print(extents)

func _physics_process(delta):
	var input = Vector2(0, 0)
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	vel = input.normalized() * speed
	var pos = position + vel * delta
	pos.x = clamp(pos.x, extents.x, screensize.x - extents.x)
	pos.y = clamp(pos.y, extents.y, screensize.y - extents.y)
	position = pos
	
