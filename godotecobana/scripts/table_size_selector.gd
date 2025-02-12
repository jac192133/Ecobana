extends OptionButton

@onready var table = get_node("/root/RoomScene/Table")

func _ready():
	# Populate dropdown menu
	clear()
	add_item("Small Table")
	add_item("Medium Table")
	add_item("Large Table")
	add_item("Extra-Long Table")

	# Ensure correct state at game start
	update_dropdown_state()
	
	# Connect selection signal
	item_selected.connect(_on_item_selected)
	
	# Connect to pause toggle signal if available
	var time_manager = get_node_or_null("/root/RoomScene/TimeManager")
	if time_manager:
		if not time_manager.time_updated.is_connected(_on_pause_toggled):
			time_manager.time_updated.connect(_on_pause_toggled)
	else:
		print("⚠️ Warning: TimeManager not found!")

func _on_item_selected(index: int):
	if table:
		table.change_table_size(index)
		print("✅ Table size changed to:", index)
	# Close dropdown after selection
	get_popup().hide()

func _on_pause_toggled(_day: int, _time_of_day: float):
	update_dropdown_state()

func update_dropdown_state():
	# Enable dropdown only when the game is paused
	disabled = not get_tree().paused
	print("🔄 Table Selector:", "ENABLED" if get_tree().paused else "DISABLED")
