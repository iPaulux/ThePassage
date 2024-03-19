extends Control


func _on_restart_button_pressed():
	get_tree().change_scene_to_file("res://level.tscn")


func _on_home_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
