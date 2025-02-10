extends Node

signal time_updated(day, time_of_day)  # Ensure correct declaration

var current_day: int = 1
var time_of_day: float = 0.0  
@export var seconds_per_day: float = 10.0  
var is_paused: bool = false  

func _process(delta):
	if is_paused:
		return  

	# Progress time of day
	time_of_day += delta / seconds_per_day
	if time_of_day >= 1.0:
		time_of_day = 0.0  
		current_day += 1
		emit_signal("time_updated", current_day, time_of_day)  # Correct emission

	emit_signal("time_updated", current_day, time_of_day)  # Ensure it's sent every frame
