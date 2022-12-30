extends Sprite

var velocity
var spin

var sprite_position

# Called when the node enters the scene tree for the first time
func _ready():
	print ("Hello Sprite")
	set_process(true)
	
# In Godot 3.x. names and functionality was changed
# You no longer need to use get/set methods to access node properties
# In addition: abbreviations like "pos" and "rot" were changed to "position" and "rotation"
	print("Self Position: ", self.position)	
	print("Self Name: ", self.name)
	
# Get position from resource
	sprite_position = self.position
	
# Desired movement in pixels/second
	velocity = Vector2(100, 100)
	
	spin = PI
	
# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta):
	sprite_position += velocity * delta
	rotation += spin * delta
	position = sprite_position
