extends RigidBody2D


func _ready():
	contact_monitor = true
	max_contacts_reported = 1 


func _on_body_entered(body):
	var game_sound = get_tree().current_scene.get_node("Hit")
	game_sound.play()
	var game_ui = get_tree().current_scene.get_node("UI") as Control
	if game_ui:
		print("Game UI found")
		if game_ui.has_method("increase_score"):
			game_ui.increase_score()
		else:
			print("increase_score method not found")
	else:
		print("Game UI not found")
	queue_free()
	
	
