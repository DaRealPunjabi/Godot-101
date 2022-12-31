extends Area2D

signal gem_grabbed

func _ready():
	pass # Replace with function body.

func _on_gem_area_entered(area):
#	print("Area: ", area.name)
	if area.name  == "player":
		emit_signal("gem_grabbed")
		queue_free()
