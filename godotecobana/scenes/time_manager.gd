extends Node

# ✅ Declare a signal that updates subscribers when time changes
signal time_updated(day, time_of_day)  

# ✅ Define core time tracking variables
var current_day: int = 1
var time_of_day: float = 0.0  
@export var seconds_per_day: float = 10.0  
var is_paused: bool = false  

func _process(delta):
	if is_paused:
		return  # ✅ Stop time progression if paused

	# ✅ Update the time of day based on real time
	time_of_day += delta / seconds_per_day

	# ✅ If a full day has passed, reset time and increment day count
	if time_of_day >= 1.0:
		time_of_day = 0.0  
		current_day += 1
		print("New Day:", current_day)  # ✅ Debugging: Check if days advance
		emit_signal("time_updated", current_day, time_of_day)  # ✅ Send signal for day update

	# ✅ Emit signal to update any UI or game elements listening for time changes
	emit_signal("time_updated", current_day, time_of_day)

func toggle_pause():
	""" ✅ Toggles the pause state of the game """
	is_paused = !is_paused
	print("Game Paused:", is_paused)  # ✅ Debugging
