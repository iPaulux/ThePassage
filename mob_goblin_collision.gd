extends CollisionPolygon2D

var show_collision_shape = true
var original_polygon = []  # Pour stocker la forme originale du polygon

func _ready():
	original_polygon = polygon.duplicate()  # Sauvegarde de la forme originale

func _draw():
	if show_collision_shape:
		var polygon = get_polygon()
		draw_polygon(polygon, [Color(255, 241, 205, 0.2)]) # Dessine avec une certaine transparence

func flip_polygon(degrees):
	if degrees == 180:
		# Inverse chaque point du polygon
		for i in range(polygon.size()):
			polygon[i] = -original_polygon[i]
	else:
		# Rétablit la forme originale
		polygon = original_polygon.duplicate()
