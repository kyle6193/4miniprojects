extends Node2D

@export var spawn_count : int = 200
@export var spawn_interval : float = 0.025
var star_scene = preload("res://Loops/star.tscn")
var time_passed : float = 0.0
var stars_spawned : int = 0

func _process(delta: float) -> void:
	if stars_spawned < spawn_count:
		time_passed += delta
		while time_passed >= spawn_interval and stars_spawned < spawn_count:
			spawn_star()
			stars_spawned += 1
			time_passed -= spawn_interval
			

func spawn_star():
		var star = star_scene.instantiate()
		add_child(star)
		
		star.position.x = randi_range(-280, 280)
		star.position.y = randi_range(-150, 150)
		
		var star_size = randf_range(0.5, 1.0)
		star.scale.x = star_size
		star.scale.y = star_size
		
		var min_scale = 0.5
		var max_scale = 1.0
		
		var t = (star_size - min_scale) / (max_scale - min_scale)
		var tint_factor = 1.0 - t
		
		var star_color = Color(1, 1, 1).lerp(Color(1, 0.25, 0.25), tint_factor)
		star.modulate = star_color
