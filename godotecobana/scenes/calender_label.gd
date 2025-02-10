extends Label

@onready var time_manager = get_node("/root/RoomScene/TimeManager")

func _ready():
	if time_manager:
		time_manager.time_updated.connect(_on_time_updated)
		print("✅ CalendarLabel connected to time_updated signal!")  # Debugging confirmation

func _on_time_updated(day: int, time_of_day: float):
	var current_hour = int(time_of_day * 24)  # Convert time_of_day (0.0-1.0) into hours (0-23)
	print("🕒 Updating Calendar UI: Day", day, "| Hour:", current_hour)  # Debugging confirmation
	
	# Update the label text
	text = "Day %d | Hour: %02d:00" % [day, current_hour]
