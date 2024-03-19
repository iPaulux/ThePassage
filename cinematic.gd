extends Control

@onready var transition = $Transition
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_video_stream_player_finished():
	transition.play("fade_out")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_transition_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://level.tscn")
