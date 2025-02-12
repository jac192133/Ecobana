extends OptionButton

@onready var table = get_node("/root/RoomScene/Table")

func _ready():
	clear()
	add_item("Small Table")
	add_item("Medium Table")
	add_item("Large Table")
	add_item("Extra-Long Table")
	item_selected.connect(_on_item_selected)

func _on_item_selected(index):
	if table:
		table.change_table_size(index)
		print("Selected table size index:", index)
