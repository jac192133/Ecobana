extends Node2D

# Define available table sizes
enum TableSize {
	SMALL,
	MEDIUM,
	LARGE,
	EXTRA_LONG
}

@export var table_size: TableSize = TableSize.MEDIUM  # Default table size

var table_shapes = {
	TableSize.SMALL: PackedVector2Array([
		Vector2(-75, -50), Vector2(75, -50), Vector2(90, 0), Vector2(-90, 0)
	]),
	TableSize.MEDIUM: PackedVector2Array([
		Vector2(-125, -75), Vector2(125, -75), Vector2(150, 0), Vector2(-150, 0)
	]),
	TableSize.LARGE: PackedVector2Array([
		Vector2(-175, -90), Vector2(175, -90), Vector2(200, 0), Vector2(-200, 0)
	]),
	TableSize.EXTRA_LONG: PackedVector2Array([
		Vector2(-250, -100), Vector2(250, -100), Vector2(280, 0), Vector2(-280, 0)
	])
}

func _ready():
	set_table_polygon()

func set_table_polygon():
	var polygon_node = get_node_or_null("TableShape")
	if polygon_node:
		polygon_node.polygon = table_shapes[table_size]

func change_table_size(size: int):
	table_size = size
	set_table_polygon()
