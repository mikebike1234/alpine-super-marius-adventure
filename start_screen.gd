extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if the enter key is pressed, start the game
	if Input.is_action_just_pressed("enter") and Input.is_action_pressed("tab"):
		Globals.lives = 5
		get_tree().change_scene_to_file("res://level_1.tscn")

