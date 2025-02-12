# pause_toggle_button.gd - Ensuring signal is emitted properly

extends Button

signal pause_toggled(is_paused: bool)

var is_paused: bool = false

func _ready():
	connect("pressed", _on_pressed)

func _on_pressed():
	is_paused = !is_paused
	emit_signal("pause_toggled", is_paused)
