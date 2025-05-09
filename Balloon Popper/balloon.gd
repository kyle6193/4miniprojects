extends Area3D

# @export makes the variable editable in the Inspector Dock
@export var clicks_to_pop : int = 4
@export var size_increase : float = 0.2
@export var score_to_give : int = 1

# _camera: The camera node that received the event (useful for raycasting or camera-relative input)
# event: The actual input event (mouse, keyboard, etc.)
# _event_position: The position in 3D space where the event occurred (e.g., where the mouse clicked the object)
# _normal: The normal vector at the event position (useful for physics or effects)
# _shape_idx: The index of the shape within the Area3D that was interacted with (if there are multiple shapes)
func _on_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed: # This means if the event is mouse related, a button, that button was LMB, and it was clicked instead of held
		scale += Vector3.ONE * size_increase #Vector3.ONE refers the object's x, y, and z dimensions. ONE is a quick way to saying all 3 are currently set to 1.
		clicks_to_pop -= 1
		
		if clicks_to_pop == 0:
			get_node("/root/Main").increase_score(score_to_give) #This takes the variable here "score_to_give" and sends it to the balloon_manager.gd script and uses it in the increase_score function
			queue_free() #This deletes the object from the screen
