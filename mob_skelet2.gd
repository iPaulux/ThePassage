extends CharacterBody2D

enum Direction {
	LEFT,
	RIGHT
}

var current_direction = Direction.LEFT
var time_elapsed = 0
var move_speed = 15  # Vitesse de déplacement en pixels par frame

func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])

func _process(delta):
	time_elapsed += delta
	if time_elapsed >= 8:  # Changement toutes les 2.7 secondes
		current_direction = Direction.RIGHT if current_direction == Direction.LEFT else Direction.LEFT
		time_elapsed = 0
		change_direction()

	move_character(delta)

func change_direction():
	if current_direction == Direction.LEFT:
		$AnimatedSprite2D.play("left")
		$VisionField/CollisionPolygon2D.flip_polygon(180)
	else:
		$AnimatedSprite2D.play("right")
		$VisionField/CollisionPolygon2D.flip_polygon(0)

func move_character(delta):
	if current_direction == Direction.LEFT:
		position.x += move_speed * delta  # Déplace le personnage vers la gauche
	else:
		position.x -= move_speed * delta  # Déplace le personnage vers la droite
