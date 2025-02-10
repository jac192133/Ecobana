extends Node

signal time_updated(day, time_of_day)  # ✅ Signal is correctly declared

var last_updated_hour: int = -1  # Stores the last hour UI was updated
var current_day: int = 1
var time_of_day: float = 0.0
@export var seconds_per_day: float = 10.0
var is_paused: bool = false

func _process(delta):
	if is_paused:
		return  # Stop if the game is paused

	time_of_day += delta / seconds_per_day  # Increment time

	# If a full day has passed, reset time and update the day
	if time_of_day >= 1.0:
		time_of_day = 0.0
		current_day += 1
		print("New Day:", current_day)
		time_updated.emit(current_day, 0.0)  # ✅ Only emit signal when day changes

	# Calculate the current hour (24-hour format)
	var current_hour = int(time_of_day * 24)

	# Only emit `time_updated` if the hour has changed (prevents redundant updates)
	if current_hour != last_updated_hour:
		last_updated_hour = current_hour
		print("Hour:", current_hour)
		time_updated.emit(current_day, time_of_day)  # ✅ Emit signal only when the hour changes



func toggle_pause():
	is_paused = !is_paused
	print("Game Paused:", is_paused)
