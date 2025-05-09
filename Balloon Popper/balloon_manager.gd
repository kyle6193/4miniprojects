extends Node3D

var score : int = 0
@export var score_text : Label # @export makes the variable editable in the Inspector Dock

func increase_score(amount):
	score += amount
	score_text.text = str("Score: ", score) # adds "Score:" before the integer for the score. 

# As a whole this script creates the score keeping and displaying to the screen
