extends Control

@onready var transition = $Transition
var start = preload("res://level.tscn")

func _on_play_button_pressed():
	transition.play("fade_out")
	
	
func _on_cinematic_button_pressed():
	get_tree().change_scene_to_file("res://cinematic.tscn")


func _on_transition_animation_finished(anim_name):
	get_tree().change_scene_to_packed(start)
