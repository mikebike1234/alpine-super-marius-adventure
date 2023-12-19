extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fallzone_body_entered(body):
	Globals.lives -= 1
	if Globals.lives > 0:
		get_tree().change_scene_to_file("res://level_1.tscn")
	else:	
		get_tree().change_scene_to_file("res://lose_screen.tscn")
