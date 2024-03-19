extends CharacterBody2D

enum Direction {
	UP,
	DOWN
}

var current_direction = Direction.UP
var time_elapsed = 0
var move_speed = 10  # Vitesse de déplacement en pixels par frame

func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])

func _process(delta):
	time_elapsed += delta
	if time_elapsed >= 5:  # Changement toutes les 2.7 secondes
		current_direction = Direction.DOWN if current_direction == Direction.UP else Direction.UP
		time_elapsed = 0
		change_direction()

	move_character(delta)

func change_direction():
	if current_direction == Direction.UP:
		$AnimatedSprite2D.play("up")
		$VisionField/CollisionPolygon2D.flip_polygon(180)
	else:
		$AnimatedSprite2D.play("down")
		$VisionField/CollisionPolygon2D.flip_polygon(0)

func move_character(delta):
	if current_direction == Direction.UP:
		position.y -= move_speed * delta  # Déplace le personnage vers le haut
	else:
		position.y += move_speed * delta  # Déplace le personnage vers le bas
