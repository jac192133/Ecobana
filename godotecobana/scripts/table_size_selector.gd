extends OptionButton

@onready var table = get_node("/root/RoomScene/Table")

func _ready():
	# Correct way to connect signals in Godot 4
	item_selected.connect(_on_item_selected)

func _on_item_selected(index: int):
	if table:
		table.change_table_size(index)
