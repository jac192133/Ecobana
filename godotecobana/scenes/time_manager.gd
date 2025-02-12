extends Node

signal time_updated(day: int, time_of_day: float)  # ✅ Declare signal

var current_day: int = 1
var last_updated_hour: int = -1
var time_of_day: float = 0.0
@export var seconds_per_day: float = 10.0

func _ready():
	# ✅ Ensure CalendarLabel listens for this signal only once
	var calendar_label = get_node_or_null("/root/RoomScene/Control/CalenderLabel")
	if calendar_label:
		if calendar_label.has_method("_on_time_manager_time_updated"):  
			if not time_updated.is_connected(calendar_label._on_time_manager_time_updated):  # ✅ Prevent duplicate connection
				time_updated.connect(calendar_label._on_time_manager_time_updated)
			else:
				print("⚠️ Warning: time_updated signal already connected to CalendarLabel.")
		else:
			print("❌ Error: _on_time_manager_time_updated() function is missing in CalendarLabel!")
	else:
		print("❌ Error: CalendarLabel not found!")

func _process(delta):
	if get_tree().paused:
		return  # ✅ Stop time when paused

	time_of_day += delta / seconds_per_day  # Increment time

	var current_hour = int(time_of_day * 24)

	if current_hour != last_updated_hour:
		last_updated_hour = current_hour
		emit_signal("time_updated", current_day, time_of_day)  # ✅ Ensure signal is used

	if time_of_day >= 1.0:
		time_of_day = 0.0  # Reset time of day
		current_day += 1  # Increment day
		emit_signal("time_updated", current_day, time_of_day)  # ✅ Ensure signal is used
