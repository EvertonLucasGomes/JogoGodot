extends Area2D


func _on_body_entered(body):
	if body.name == "player":
		if Globals.score == 1000 and Globals.coins == 20:
			get_tree().change_scene_to_file("res://prefabs/Win.tscn")
			
