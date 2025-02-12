extends Label

var current_day: int = 1

func _ready():
	var time_manager = get_node_or_null("/root/RoomScene/TimeManager")
	if time_manager:
		time_manager.connect("day_changed", _on_day_changed)
		time_manager.connect("time_updated", _on_time_updated)

func _on_day_changed(new_day: int):
	current_day = new_day
	update_label()

func _on_time_updated(hour: int, minute: int):
	update_label(hour, minute)

func update_label(hour: int = 0, minute: int = 0):
	var ampm = "am"
	var display_hour = hour
	if hour >= 12:
		ampm = "pm"
		if hour > 12:
			display_hour -= 12
	elif hour == 0:
		display_hour = 12  # Midnight should be 12 AM
	
	text = "Day %d %02d:%02d%s" % [current_day, display_hour, minute, ampm]
