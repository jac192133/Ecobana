extends Button  # ✅ Correctly extending Button

func _ready():
	# Start the game in a paused state
	get_tree().paused = true
	update_button_appearance()

	# Connect the button press signal
	self.pressed.connect(_on_PauseToggleButton_pressed)

	# Prevent Spacebar from accidentally "clicking" the button
	focus_mode = Control.FOCUS_NONE

	# Ensure the script always processes input (for Spacebar toggle)
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event):
	if event.is_action_pressed("pause_toggle"):  # Spacebar toggles pause
		toggle_pause()

func _on_PauseToggleButton_pressed():
	toggle_pause()

func toggle_pause():
	# Toggle the paused state
	get_tree().paused = not get_tree().paused
	update_button_appearance()

func update_button_appearance():
	var style = StyleBoxFlat.new()
	
	if get_tree().paused:
		text = "PAUSED"
		style.bg_color = Color(0.678, 0.847, 0.902)  # Light blue
	else:
		text = "UNPAUSED"
		style.bg_color = Color(1.0, 0.627, 0.478)  # Light red

	# Apply styles to the button
	set("theme_override_styles/normal", style)
	add_theme_color_override("font_color", Color(0, 0, 0))  # Black text
