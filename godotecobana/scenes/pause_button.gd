extends Button

func _ready():
	# Ensure the game starts in a paused state
	get_tree().paused = true
	# Update the button's appearance to reflect the paused state
	update_button_appearance()
	# Connect the button's pressed signal to toggle_pause
	self.pressed.connect(_on_PauseButton_pressed)
	# Set the button to ignore focus to prevent Spacebar activation issues
	focus_mode = Control.FOCUS_NONE
	# Ensure the script always processes input
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event):
	if event.is_action_pressed("pause_toggle"):
		toggle_pause()

func _on_PauseButton_pressed():
	toggle_pause()

func toggle_pause():
	# Toggle the paused state
	get_tree().paused = not get_tree().paused
	# Update the button's appearance based on the new state
	update_button_appearance()

func update_button_appearance():
	var style = StyleBoxFlat.new()

	if get_tree().paused:
		text = "PAUSED"
		style.bg_color = Color(0.678, 0.847, 0.902) # Light blue
	else:
		text = "UNPAUSED"
		style.bg_color = Color(1.0, 0.627, 0.478) # Light red

	add_theme_color_override("font_color", Color(0, 0, 0))  # ✅ Black text
	set("theme_override_styles/panel", style)  # ✅ Corrected way to override button color
