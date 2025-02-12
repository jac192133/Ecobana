extends OptionButton

@onready var table = get_node("/root/RoomScene/Table")
@onready var time_manager = get_node("/root/RoomScene/TimeManager")  # Get the time manager

var previous_pause_state: bool = false  # Track last pause state

func _ready():
	var popup = get_popup()
	popup.hide()  # Ensure the dropdown is hidden on start

	# Add items to the dropdown
	clear()
	add_item("Small Table")
	add_item("Medium Table")
	add_item("Large Table")
	add_item("Extra-Long Table")

	# ✅ Ensure dropdown starts correctly
	await get_tree().process_frame  # Ensures first frame is processed
	update_dropdown_state()

func _process(_delta):
	# ✅ Manually detect pause changes
	if get_tree().paused != previous_pause_state:
		previous_pause_state = get_tree().paused
		update_dropdown_state()

func _on_dropdown_toggle():
	if get_tree().paused:  # ✅ Only toggle if game is paused
		var popup = get_popup()
		if popup.is_visible():
			popup.hide()  # Close the dropdown
		else:
			popup.popup(Rect2(global_position + Vector2(0, 50), popup.size))  # Open it
	else:
		print("Dropdown is disabled while unpaused!")  # Debug message

func _on_item_selected(index: int):
	if table:
		table.change_table_size(index)
		print("Table size changed to:", index)

	# Close the dropdown after selection
	get_popup().hide()

func update_dropdown_state():
	self.disabled = not get_tree().paused  # ✅ Fix logic: ENABLED when paused, DISABLED when unpaused
	print("Dropdown", "ENABLED" if get_tree().paused else "DISABLED", "(Paused:", get_tree().paused, ")")
