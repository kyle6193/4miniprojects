extends Node2D

# This script controls the spawning of star objects in the scene.
# @export makes the variable editable in the Inspector Dock
@export var spawn_count : int = 200
@export var spawn_interval : float = 0.025
var star_scene = preload("res://Loops/star.tscn") # this adds a file to the game at launch. In this case, the star scene
var time_passed : float = 0.0
var stars_spawned : int = 0

func _process(delta: float) -> void:
	if stars_spawned < spawn_count:
		time_passed += delta # Add time since last frame to the time_passed variable
		while time_passed >= spawn_interval and stars_spawned < spawn_count: # Checks if time_passed is greater than the spawn interval due to something like a lag spike
			# If so, spawns a star and corrects the count, accounting for the spike
			spawn_star() # Spawn a new star
			stars_spawned += 1 # Increment the count
			time_passed -= spawn_interval # Subtract the interval to keep accurate timing
			# This ensures that even if the game lags, stars will still spawn at the correct rate
			

func spawn_star():
	var star = star_scene.instantiate() # instantiate adds the star to memory based on the preload from above
	add_child(star) # This line literally adds the star to the scene tree, making it visible in the game
	# Randomize star position within a defined range
	star.position.x = randi_range(-280, 280)
	star.position.y = randi_range(-150, 150)
	# Randomize star size
	var star_size = randf_range(0.5, 1.0)
	star.scale.x = star_size
	star.scale.y = star_size
	# Linear interpolation to simulate redshift of stars as they travel away from camera
	var min_scale = 0.5 #smallest a star can be
	var max_scale = 1.0 #largest a star can be
	var t = (star_size - min_scale) / (max_scale - min_scale) #interpolation formula. Best just to re-look that one up. Standard math stuff
	var tint_factor = 1.0 - t #As the number goes more and more below 1.0 it changes color
	var star_color = Color(1, 1, 1).lerp(Color(1, 0.25, 0.25), tint_factor) #starting color and ending color extremes
	star.modulate = star_color # Apply the color tint
