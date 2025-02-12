extends Node2D

# Define available table sizes
enum TableSize {
	SMALL,
	MEDIUM,
	LARGE,
	EXTRA_LONG
}

@export var table_size: TableSize = TableSize.MEDIUM  # Default table size

# Predefined polygon points for each table size
var table_shapes = {
	TableSize.SMALL: {
		"TableTop": PackedVector2Array([
			Vector2(-75, -50), Vector2(75, -50), Vector2(90, 0), Vector2(-90, 0)
		]),
		"TableFront": PackedVector2Array([
			Vector2(-90, 0), Vector2(90, 0), Vector2(90, 20), Vector2(-90, 20)
		]),
		"TableLeft": PackedVector2Array([
			Vector2(-75, -50), Vector2(-90, 0), Vector2(-90, 20), Vector2(-75, -30)
		]),
		"TableRight": PackedVector2Array([
			Vector2(75, -50), Vector2(90, 0), Vector2(90, 20), Vector2(75, -30)
		])
	},
	TableSize.MEDIUM: {
		"TableTop": PackedVector2Array([
			Vector2(-125, -75), Vector2(125, -75), Vector2(150, 0), Vector2(-150, 0)
		]),
		"TableFront": PackedVector2Array([
			Vector2(-150, 0), Vector2(150, 0), Vector2(150, 30), Vector2(-150, 30)
		]),
		"TableLeft": PackedVector2Array([
			Vector2(-125, -75), Vector2(-150, 0), Vector2(-150, 30), Vector2(-125, -45)
		]),
		"TableRight": PackedVector2Array([
			Vector2(125, -75), Vector2(150, 0), Vector2(150, 30), Vector2(125, -45)
		])
	},
	TableSize.LARGE: {
		"TableTop": PackedVector2Array([
			Vector2(-175, -90), Vector2(175, -90), Vector2(200, 0), Vector2(-200, 0)
		]),
		"TableFront": PackedVector2Array([
			Vector2(-200, 0), Vector2(200, 0), Vector2(200, 40), Vector2(-200, 40)
		]),
		"TableLeft": PackedVector2Array([
			Vector2(-175, -90), Vector2(-200, 0), Vector2(-200, 40), Vector2(-175, -50)
		]),
		"TableRight": PackedVector2Array([
			Vector2(175, -90), Vector2(200, 0), Vector2(200, 40), Vector2(175, -50)
		])
	},
	TableSize.EXTRA_LONG: {
		"TableTop": PackedVector2Array([
			Vector2(-250, -100), Vector2(250, -100), Vector2(280, 0), Vector2(-280, 0)
		]),
		"TableFront": PackedVector2Array([
			Vector2(-280, 0), Vector2(280, 0), Vector2(280, 50), Vector2(-280, 50)
		]),
		"TableLeft": PackedVector2Array([
			Vector2(-250, -100), Vector2(-280, 0), Vector2(-280, 50), Vector2(-250, -50)
		]),
		"TableRight": PackedVector2Array([
			Vector2(250, -100), Vector2(280, 0), Vector2(280, 50), Vector2(250, -50)
		])
	}
}

func _ready():
	set_table_polygons()

func set_table_polygons():
	for part_name in table_shapes[table_size]:
		var polygon_node = get_node_or_null(part_name)
		if polygon_node:
			polygon_node.polygon = table_shapes[table_size][part_name]

func change_table_size(size: int):
	table_size = TableSize.values()[size]  # ✅ Converts int to enum properly
	set_table_polygons()
