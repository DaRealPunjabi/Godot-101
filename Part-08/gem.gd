extends Area2D

onready var effect = get_node("effect")
onready var sprite = get_node("sprite")
onready var collision = create_shape_owner(get_node("collision"))

signal gem_grabbed

func _ready():
#	effect.interpolate_property(sprite, 'transform/scale',
#		sprite.scale, Vector2(2.0, 2.0), 0.3,
#		Tween.TRANS_QUAD, Tween.EASE_OUT)
#	effect.interpolate_property(sprite, 'visibility/opacity',
#			1, 0, 0.3,
#			Tween.TRANS_QUAD, Tween.EASE_OUT)
	print("Sprite scale: ", sprite.scale)
	effect.interpolate_property(sprite, "scale",
		sprite.scale, Vector2(2.0, 2.0), 0.3,
		Tween.TRANS_QUAD, Tween.EASE_OUT)
	effect.interpolate_property(sprite, "modulate:a",
		1.0, 0.0, 0.3,
		Tween.TRANS_QUAD, Tween.EASE_OUT)

func _on_gem_area_entered(area):
	print("On gem entered: ", area.name)
	if area.name  == "player":
		emit_signal("gem_grabbed")
		shape_owner_clear_shapes( collision )
		effect.start()
		
func _on_effect_tween_completed(object, key):
	print("effect completed")
	queue_free()
