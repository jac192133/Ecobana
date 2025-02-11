extends ColorRect

@onready var pause_label = $PauseLabel

func _ready():
	# Allow button clicks and spacebar to toggle pause
	set_process_input(true)
	update_pause_state()

func _input(event):
	if event.is_action_pressed("pause_toggle"):  # Spacebar toggles pause
		toggle_pause()

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		toggle_pause()

func toggle_pause():
	get_tree().paused = !get_tree().paused  # Toggle pause state
	update_pause_state()

func update_pause_state():
	if get_tree().paused:
		self.color = Color(0.6, 0.8, 1.0)  # Light blue when paused
		pause_label.text = "PAUSED"
	else:
		self.color = Color(1.0, 0.4, 0.4)  # Light red when unpaused
		pause_label.text = "UNPAUSED"
