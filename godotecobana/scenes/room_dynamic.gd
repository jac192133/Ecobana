extends Node2D

@export var width: float = 200  # Adjust for different objects
@export var height: float = 150
@export var depth: float = 100
@export var color_back: Color = Color(0.2, 0.2, 0.2)   # Darkest
@export var color_left: Color = Color(0.4, 0.4, 0.4)   # Medium
@export var color_floor: Color = Color(0.6, 0.6, 0.6)  # Lightest

var back_wall: Polygon2D
var left_wall: Polygon2D
var floor: Polygon2D

func _ready():
	# Create 3D-looking shape
	back_wall = create_polygon([
		Vector2(0, 0),
		Vector2(width, 0),
		Vector2(width, height),
		Vector2(0, height)
	], color_back)

	left_wall = create_polygon([
		Vector2(0, 0),
		Vector2(-depth, depth * 0.5),
		Vector2(-depth, height + depth * 0.5),
		Vector2(0, height)
	], color_left)

	floor = create_polygon([
		Vector2(0, height),
		Vector2(width, height),
		Vector2(width - depth, height + depth * 0.5),
		Vector2(-depth, height + depth * 0.5)
	], color_floor)

	# Add to scene
	add_child(back_wall)
	add_child(left_wall)
	add_child(floor)

func create_polygon(points: Array, color: Color) -> Polygon2D:
	var poly = Polygon2D.new()
	poly.polygon = points
	poly.color = color
	return poly
