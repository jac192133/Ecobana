extends Button

signal pause_toggled(is_paused: bool)

func _ready():
	connect("pressed", _on_pressed)

	var time_manager = get_node_or_null("/root/RoomScene/TimeManager")
	if time_manager:
		time_manager.set_paused(true)  # Game starts paused
		update_button_text(true)

func _unhandled_input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		toggle_pause()

func _on_pressed():
	toggle_pause()

func toggle_pause():
	var time_manager = get_node_or_null("/root/RoomScene/TimeManager")
	if time_manager:
		var new_state = !time_manager.is_paused
		time_manager.set_paused(new_state)
		emit_signal("pause_toggled", new_state)
		update_button_text(new_state)

func update_button_text(is_paused: bool):
	text = "❚❚" if is_paused else "►"
