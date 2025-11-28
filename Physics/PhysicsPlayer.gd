# This script controls a 2D physics player that can be pushed by mouse clicks.
extends RigidBody2D

var hit_force : float = 50.0 # The strength of the impulse applied to the player

func _process(delta: float):
	# If the left mouse button is pressed, apply an impulse toward the mouse position
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var dir = global_position.direction_to(get_global_mouse_position()) # Get direction to mouse
		apply_impulse(dir * hit_force) # Apply force in that direction

# This script moves the player in the direction of the mouse click when the left mouse button is pressed.