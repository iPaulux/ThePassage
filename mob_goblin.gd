extends CharacterBody2D

enum Direction {
	UP,
	DOWN
}

var current_direction = Direction.UP
var time_elapsed = 0

func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])

func _process(delta):
	time_elapsed += delta
	if time_elapsed >= 2.6:  # Changement toutes les 5 secondes
		current_direction = Direction.DOWN if current_direction == Direction.UP else Direction.UP
		time_elapsed = 0
		change_direction()

func change_direction():
	if current_direction == Direction.UP:
		$AnimatedSprite2D.play("up")  # Assurez-vous que le nom de l'animation est correct
		$VisionField/CollisionPolygon2D.flip_polygon(180)
	else:
		$AnimatedSprite2D.play("down")  # Assurez-vous que le nom de l'animation est correct
		$VisionField/CollisionPolygon2D.flip_polygon(0)
