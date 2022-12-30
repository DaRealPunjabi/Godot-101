extends Sprite

var sprite_position
var sprite_size
var screen_size

# Desired movement in pixels/second.
var velocity
var spin


# Called when the node enters the scene tree for the first time
func _ready():
	set_process(true)
	
	screen_size = get_viewport().size
	sprite_size = get_texture().get_size()
	
#	Place the sprite in the centre
	sprite_position = screen_size / 2
	position = sprite_position
	
	randomize()
	velocity = Vector2(rand_range(100,500), rand_range(100,500)).rotated(rand_range(0, 2*PI))
	
	spin = rand_range(-PI, PI)
	
# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta):
	sprite_position += velocity * delta
	rotation += spin * delta
	if sprite_position.x >= screen_size.x - sprite_size.x:
		sprite_position.x = screen_size.x - sprite_size.x
		velocity.x *= -1
	if sprite_position.y >= screen_size.y - sprite_size.y:
		sprite_position.y = screen_size.y - sprite_size.y
		velocity.y *= -1
	if sprite_position.x <= 0 + sprite_size.x:
		sprite_position.x = sprite_size.x
		velocity.x *= -1
	if sprite_position.y <= 0 + sprite_size.y:
		sprite_position.y = sprite_size.y
		velocity.y *= -1
	
	position = sprite_position

