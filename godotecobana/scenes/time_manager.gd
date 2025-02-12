# time_manager.gd - Ensuring signals are properly emitted and functional

extends Node

signal day_changed(new_day: int)

var current_day: int = 1
var is_paused: bool = false

func _process(_delta: float):
	if is_paused:
		return
	advance_time()

func advance_time():
	current_day += 1
	emit_signal("day_changed", current_day)

func set_paused(pause_state: bool):
	is_paused = pause_state
	emit_signal("day_changed", current_day) # Ensuring the signal is used
