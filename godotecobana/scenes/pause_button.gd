extends ColorRect  # ✅ Fix: Change from Button to ColorRect

func _ready():
	get_tree().paused = true  # Start game paused
	update_button_appearance()
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("pause_toggle"):
		toggle_pause()

func toggle_pause():
	get_tree().paused = not get_tree().paused
	update_button_appearance()

func update_button_appearance():
	var style = StyleBoxFlat.new()
	
	if get_tree().paused:
		style.bg_color = Color(0.678, 0.847, 0.902)  # Light blue
		self.get_parent().get_node("PauseLabel").text = "PAUSED"  # Assuming PauseLabel is inside
	else:
		style.bg_color = Color(1.0, 0.627, 0.478)  # Light red
		self.get_parent().get_node("PauseLabel").text = "UNPAUSED"

	self.set("theme_override_styles/panel", style)  # Corrected way to change color
