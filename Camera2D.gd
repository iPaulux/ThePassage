extends Camera2D


func _process(delta):
	label.text = "Temps Restant : " + str(timer.time_left)

func _on_timer_timeout():
	print("Temps écoulé!")
	get_tree().change_scene_to_file("res://defeatr.tscn")
