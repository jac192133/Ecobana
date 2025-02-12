extends Node

signal day_changed(new_day: int)
signal time_updated(hour: int, minute: int)

var current_day: int = 1
var current_hour: int = 0
var current_minute: int = 0
var hours_per_day: int = 24
var minutes_per_hour: int = 60
var time_speed: float = 6.0
var is_paused: bool = true  # Game starts paused

var time_accumulator: float = 0.0

func _ready():
	emit_signal("day_changed", current_day)
	emit_signal("time_updated", current_hour, current_minute)

func _process(delta: float):
	if is_paused:
		return
	
	time_accumulator += delta * time_speed

	while time_accumulator >= 1.0:
		time_accumulator -= 1.0
		advance_time()

func advance_time():
	current_minute += 1

	if current_minute >= minutes_per_hour:
		current_minute = 0
		current_hour += 1

	if current_hour >= hours_per_day:
		current_hour = 0
		current_day += 1
		emit_signal("day_changed", current_day)

	emit_signal("time_updated", current_hour, current_minute)

func set_paused(pause_state: bool):
	is_paused = pause_state
