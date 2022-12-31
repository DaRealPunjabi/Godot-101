extends Node2D

onready var gem = preload("res://gem.tscn")
onready var gem_container = get_node("gem_container")

var screensize
var score = 0
var level = 1

func _ready():
	randomize()
	screensize = get_viewport().size
	set_process(true)
	spawn_gems(10)

func _process(delta):
	if gem_container.get_child_count() == 0:
		level += 1
		spawn_gems(level * 10)

func spawn_gems(num):
#	var g = gem.instance()
#	print("G: ", g)
#	print("Screensize: ", screensize)
#	print("G Position: ", g.position)
#	gem_container.add_child(g)
#	g.position = Vector2(50, 50)
	for i in range(num):
		var g = gem.instance()
		gem_container.add_child(g)
		g.position = Vector2(rand_range(40, screensize.x-40),
						  rand_range(40, screensize.y-40))
