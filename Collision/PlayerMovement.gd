# This script controls the player movement and collision logic in a 3D environment.
extends RigidBody3D

@export var move_speed : float = 2.5 # @export makes the variable editable in the Inspector Dock

func _physics_process(_delta: float) -> void: # physics process is like process but already has a consistent processing time. It doesn't matter what the user's refresh rate is
	if Input.is_key_pressed(KEY_LEFT):
		linear_velocity.x = - move_speed
	if Input.is_key_pressed(KEY_RIGHT):
		linear_velocity.x = move_speed
	if Input.is_key_pressed(KEY_A):
		linear_velocity.x = -move_speed
	if Input.is_key_pressed(KEY_D):
		linear_velocity.x = move_speed

func _on_body_entered(body: Node) -> void: #This is a signal from godot. It checks for when one collider makes contact with another
	if body.is_in_group("Tree"): #But it ignores the ground. It only cares if the collider is in the Tree group
		get_tree().reload_current_scene() #Resets the game
