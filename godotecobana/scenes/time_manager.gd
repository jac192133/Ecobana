extends Node

signal time_updated(day, time_of_day)  # ✅ Signal is correctly declared

var current_day: int = 1
var time_of_day: float = 0.0
@export var seconds_per_day: float = 10.0
var is_paused: bool = false

func _process(delta):
	print("Processing frame...")  # ✅ Confirms the function is running

	if is_paused:
		return

	time_of_day += delta / seconds_per_day
	print("Time of Day:", time_of_day)  # ✅ Check if time progresses

	if time_of_day >= 1.0:
		time_of_day = 0.0
		current_day += 1
		print("New Day:", current_day)  # ✅ Verify day tracking
		time_updated.emit(current_day, time_of_day)

	time_updated.emit(current_day, time_of_day)


func toggle_pause():
	is_paused = !is_paused
	print("Game Paused:", is_paused)
