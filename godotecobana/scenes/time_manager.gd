extends Node

signal time_updated(day, time_of_day)  # ✅ Signal is correctly declared

var current_day: int = 1
var last_updated_hour: int = -1  # Stores the last hour UI was updated

var time_of_day: float = 0.0
@export var seconds_per_day: float = 10.0
var is_paused: bool = false

func _process(delta):
	if is_paused:
		return  # ✅ Stop if the game is paused

	# ✅ Increment time based on speed settings
	time_of_day += (delta / seconds_per_day)

	# ✅ If a full day has passed, reset time and increment day
	if time_of_day >= 1.0:
		time_of_day = 0.0
		current_day += 1
		print("🌅 New Day Started: Day", current_day)
		time_updated.emit(current_day, 0.0)  # ✅ Emit only at the start of a new day

	# ✅ Convert 0.0-1.0 time_of_day into an hour (0-23)
	var current_hour = int(time_of_day * 24)

	# ✅ Only emit `time_updated` if the hour has changed
	if current_hour != last_updated_hour:
		last_updated_hour = current_hour  # ✅ Store the last updated hour
		print("🕒 Hour Changed:", current_hour)
		time_updated.emit(current_day, time_of_day)  # ✅ Emit signal only when hour updates

func toggle_pause():
	is_paused = !is_paused
	print("Game Paused:", is_paused)
