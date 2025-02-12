extends OptionButton

@onready var table = get_node("/root/RoomScene/Table")

func _ready():
	# Ensure the signal is connected properly
	item_selected.connect(_on_item_selected)

func _on_item_selected(index: int):
	if table:
		# Get the TableSize enum from the table script
		var table_enum = table.get("TableSize")  
		if table_enum:
			table.change_table_size(index)
			print("Table size changed to:", table_enum.keys()[index])  # Debug output
		else:
			print("ERROR: TableSize enum not found in table.")
