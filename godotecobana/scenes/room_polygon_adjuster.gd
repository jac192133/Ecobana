extends Node2D

@export var main_wall_points: PackedVector2Array = [
	Vector2(0, 0), Vector2(1280, 0), Vector2(1280, 720), Vector2(0, 720)
]

@export var floor_points: PackedVector2Array = [
	Vector2(0, 720), Vector2(1280, 720), Vector2(980, 1020), Vector2(-300, 1020)
]

@export var left_wall_points: PackedVector2Array = [
	Vector2(0, 0), Vector2(-300, 300), Vector2(-300, 1020), Vector2(0, 720)
]

@export var right_wall_points: PackedVector2Array = [
	Vector2(1280, 0), Vector2(980, 300), Vector2(980, 1020), Vector2(1280, 720)
]

@export var ceiling_points: PackedVector2Array = [
	Vector2(0, 0), Vector2(1280, 0), Vector2(980, 300), Vector2(-300, 300)
]

func _ready():
	set_polygon("MainWall", main_wall_points)
	set_polygon("Floor", floor_points)
	set_polygon("LeftWall", left_wall_points)
	set_polygon("RightWall", right_wall_points)
	set_polygon("Ceiling", ceiling_points)

func set_polygon(node_name: String, points: PackedVector2Array):
	var polygon_node = get_node_or_null(node_name)
	if polygon_node:
		polygon_node.polygon = points
