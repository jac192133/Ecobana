extends OptionButton

@onready var table = get_node("/root/RoomScene/Table")
@onready var time_manager = get_node("/root/RoomScene/TimeManager")  # Get the time manager

var is_dropdown_open = false  # Track dropdown state

func _ready():
	var popup = get_popup()
	
	# Ensure the popup appears correctly
	popup.call_deferred("reset_size")  # Ensures proper sizing
	popup.hide()  # Hide initially so it doesn't show up on game start

	# Add items to the dropdown
	clear()
	add_item("Small Table")
	add_item("Medium Table")
	add_item("Large Table")
	add_item("Extra-Long Table")

	# Connect signals
	item_selected.connect(_on_item_selected)
	self.pressed.connect(_on_dropdown_toggle)  # Toggle dropdown when clicked

func _on_dropdown_toggle():
	if time_manager and time_manager.is_paused:  # Only toggle while paused
		var popup = get_popup()
		
		if is_dropdown_open:
			popup.hide()  # Close the dropdown
		else:
			popup.popup(Rect2(global_position + Vector2(0, 50), popup.size))  # Open it

		is_dropdown_open = !is_dropdown_open  # Toggle state

func _on_item_selected(index: int):
	if table:
		table.change_table_size(index)
		print("Table size changed to:", index)

	# Close the dropdown after selection
	is_dropdown_open = false
	get_popup().hide()
